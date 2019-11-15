const log4js = require("log4js");
const appConfig = require("../appConfig");
log4js.configure({
  appenders: {
    infoimage: { type: "file", filename: "infoimage.log" }
  },
  categories: { default: { appenders: ["infoimage"], level: "error" } }
});

const logger = log4js.getLogger("infoimage");
logger.level = appConfig.logger_level;

module.exports = logger;
