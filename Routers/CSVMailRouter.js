const express = require("express");
const Router = express.Router();
const CSVMailController = require("../Controller/CSVMailController");
const Logger = require("../Services/LoggerService");
Router.post("/", async (request, response) => {
  Logger.info(`CSVMailRouter.post("/") - Post Request to api/v1/csvmail/`);
  Logger.debug(
    `CSVMailRouter.post("/") - @Request Body - ` + "\n",
    request.body
  );
  await CSVMailController.mailCSV(request, response);
});

module.exports = Router;
