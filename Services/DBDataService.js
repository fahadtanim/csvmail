const DBDataRepository = require("../Data/DBDataRepository");
const Logger = require("../Services/LoggerService");
class DBDataService {
  async getDBData(data) {
    Logger.info(
      "DBDataService.getDBData() - Come to DBDataService's getDBData Method"
    );
    let queryData = await DBDataRepository.getQueryData(
      data.db_credentials,
      data.query
    );

    Logger.debug(
      "DBDataService.getDBData() - @Data - \n",
      data,
      "\n@QueryData - ",
      queryData
    );
    return queryData;
  }
}

module.exports = new DBDataService();
