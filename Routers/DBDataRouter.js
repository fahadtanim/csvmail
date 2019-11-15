const express = require("express");
const Router = express.Router();
const DBDataController = require("../Controller/DBDataController");
const Logger = require("../Services/LoggerService");
Router.post("/", async (request, response) => {
  Logger.info(`DBDataRouter.post("/") - Post Request to api/v1/dbdata/`);
  Logger.debug(
    `DBDataRouter.post("/") - @Request Body - ` + "\n",
    request.body
  );
  await DBDataController.getData(request, response);
});

module.exports = Router;
