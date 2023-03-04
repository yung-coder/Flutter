const express = require("express");
const http = require("http");
const { default: mongoose } = require("mongoose");
const dotenv = require("dotenv");

const app = express();

var server = http.createServer(app);
const PORT = 3000;

var io = require("socket.io")(server);
dotenv.config();
app.use(express.json());

mongoose
  .connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    app.listen(PORT, () => console.log(`Server running on Port: ${PORT}`));
    // User.insertMany(users);
    // Post.insertMany(posts);
  })
  .catch((error) => console.log(`${error} did not connect`));
