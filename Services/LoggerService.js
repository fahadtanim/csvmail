const log4js = require("log4js");
log4js.configure({
  appenders: {
    infoimage: { type: "file", filename: "infoimage.log" }
  },
  categories: { default: { appenders: ["infoimage"], level: "error" } }
});

const logger = log4js.getLogger("infoimage");
logger.level = "all";

module.exports = logger;
