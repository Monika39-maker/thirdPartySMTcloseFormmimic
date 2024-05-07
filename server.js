const http = require("http");
const fs = require("fs");
const path = require("path");
const cors = require("cors");
const { Pool } = require("pg");
const express = require("express");

const app = express();


app.use(cors());

app.use(express.json());

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "postgres",
  password: "*****",
  port: 5434,
});




app.delete("/delete", (req, res) => {
  console.log(req.body)
  const { request_type, vgnumber, issue_id } = req.body
  
  try {
    pool.query('DELETE FROM smt WHERE issue_id = $1 AND vgnumber = $2 AND request_type = $3', [issue_id, vgnumber, request_type]);
    res.status(200).send("Row deleted successfully");
  } catch (error) {
    console.error("Error deleting row:", error);
    res.status(500).send("Error deleting row from database");
  }
});

app.get("/", function (request, response) {
  response.sendFile(__dirname + "/index.html");
});


const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`server is running in port ${PORT}`));
wwsx