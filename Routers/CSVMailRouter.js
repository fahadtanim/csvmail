const express = require("express");
const Router = express.Router();
const CSVMailController = require("../Controller/CSVMailController");
Router.post("/", async (request, response) => {
  await CSVMailController.mailCSV(request, response);
});

module.exports = Router;
