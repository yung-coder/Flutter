const express = require("express");
const mongoose = require("mongoose");
const http = require("http");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
const PORT = 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);
app.use(express.json());

io.on("connection", function (socket) {
  console.log("connected !");
  socket.on("createRoom", ({ name }) => {
    console.log(name);
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
