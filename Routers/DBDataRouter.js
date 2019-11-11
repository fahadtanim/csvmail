const express = require("express");
const Router = express.Router();
const DBDataController = require("../Controller/DBDataController");
Router.post("/", async (request, response) => {
  await DBDataController.getData(request, response);
});

module.exports = Router;
