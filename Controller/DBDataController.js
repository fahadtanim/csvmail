const DBDataService = require("../Services/DBDataService");
const Logger = require("../Services/LoggerService");
class DBDataController {
  async getData(request, response) {
    Logger.info("DBDataController.getData() - DBDataController getData Method");
    let data = request.body;
    let res = {};
    Logger.debug("DBDataController.getData() - @Data - \n", data);
    try {
      Logger.info(
        "DBDataController.getData() - Trying to get data from DBDataService.getDBData()"
      );
      res.data = await DBDataService.getDBData(data);
      res.status = "successful";
      res.message = "";
      Logger.info("DBDataController.getData() - @Res - ", res);
    } catch (err) {
      Logger.error(
        "DBDataController.getData() - ERROR - error while retrieving service data - \n",
        err
      );
      res.data = {};
      res.status = "unsuccessful";
      res.message = err;
      Logger.info("DBDataController.getData() - @Res - ", res);
    }
    response.send(res);
  }
}

module.exports = new DBDataController();
