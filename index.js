const express = require("express");
const log4js = require("log4js");
const CSVMailRouter = require("./Routers/CSVMailRouter");
const DBDataRouter = require("./Routers/DBDataRouter");
const CleanUpRouter = require("./Routers/CleanUpRouter");
const ReportRouter = require("./Routers/ReportRouter");
const Logger = require("./Services/LoggerService");
const path = require("path");
global.appRoot = path.resolve(__dirname);
const app = express();

const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(
  log4js.connectLogger(Logger, {
    level: "info",
    // include the Express request ID in the logs
    format: (req, res, format) =>
      format(
        `:remote-addr - ${req.id} - METHOD = ":method", URL = ":url", HTTP/:http-version STATUS = :status, CONTENT_LENGTH = :content-length, REFERER = ":referrer", USER_AGENT = ":user-agent" RESPONSE_TIME = ":response-time ms"`
      )
  })
);

app.use("/api/v1/csvmail", CSVMailRouter);
app.use("/api/v1/dbdata", DBDataRouter);
app.use("/api/v1/cleanup", CleanUpRouter);
app.use("/api/v1/report", ReportRouter);

//#######################################
//###########  SERVER START  ############
//#######################################

app.listen(PORT, () => {
  // console.log("server started!! Port : " + PORT);
  Logger.info(`Server Started at Port "${PORT}"`);
  //   console.log(app_config.port);
});

//#######################################
//###########  SERVER END  ##############
//#######################################
