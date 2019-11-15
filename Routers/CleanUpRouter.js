const CleanUpController = require("../Controller/CleanUpController");
const express = require("express");
const Router = express.Router();
const Logger = require("../Services/LoggerService");
Router.delete("/", (request, response) => {
  Logger.info(`CleanUpRouter.delete("/") - Delete Request to api/v1/cleanup/`);
  Logger.debug(
    `CleanUpRouter.delete("/") - @Request Body - ` + "\n",
    request.body
  );
  CleanUpController.clean(request, response);
});

module.exports = Router;
