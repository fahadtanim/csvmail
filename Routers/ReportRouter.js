const ReportController = require("../Controller/ReportController");
const express = require("express");
const Router = express.Router();
const Logger = require("../Services/LoggerService");
Router.post("/", (request, response) => {
  Logger.info(`ReportRouter.post("/") - Post Request to api/v1/report/`);
  Logger.debug(`ReportRouter.post("/") - @Request Body - `, "\n", request.body);
  ReportController.report(request, response);
});

module.exports = Router;
