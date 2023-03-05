const express = require("express");
const mongoose = require("mongoose");
const http = require("http");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
const PORT = 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);
const Room = require("./models/room.js");
app.use(express.json());

io.on("connection", function (socket) {
  console.log("connected !");
  socket.on("createRoom", async ({ name }) => {
    try {
      let room = new Room();
      let player = {
        socketID: socket.id,
        name,
        playerType: "X",
      };
      room.players.push(player);
      room.turn = player;
      room = await room.save();

      const roomId = room._id.toString();
      socket.join(roomId);
      io.to(roomId).emit("createRoomDone", room);
    } catch (error) {
      console.log(error);
    }
  });
});

mongoose
  .connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    server.listen(PORT, () => console.log(`Server running on Port: ${PORT}`));
    // User.insertMany(users);
    // Post.insertMany(posts);
  })
  .catch((error) => console.log(`${error} did not connect`));
