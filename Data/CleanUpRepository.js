const DBConnect = require("./DBConnect");
const appConfig = require("../appConfig");
const Logger = require("../Services/LoggerService");
class CleanUpRepository {
  async cleanUp() {
    Logger.info(
      "CleanUpRepository.cleanUp() - CleanUpController cleanUp Method"
    );
    this.connection = DBConnect.getConnection(appConfig.database);
    let result = {
      query_status: []
    };
    Logger.debug(
      "CleanUpRepository.cleanUp() - @appConfig - \n",
      appConfig,
      "\n@Connection - \n",
      this.connection
    );
    for (let i = 0; i < appConfig.clean_up_queries.length; i++) {
      let check = false;
      for (let j = 0; j < 3; j++) {
        try {
          Logger.info(
            "CleanUpRepository.cleanUp() - @query no " +
              i +
              " - try - " +
              j +
              " - ",
            appConfig.clean_up_queries[i]
          );
          let res = await this.query(appConfig.clean_up_queries[i]);
          check = true;
          break;
        } catch (err) {
          Logger.info(
            "CleanUpRepository.cleanUp() - RETRY - @query no " +
              i +
              " - try - " +
              j +
              " - ",
            appConfig.clean_up_queries[i]
          );
          check = false;
        }
      }
      if (check) result.query_status.push("successful");
      else result.query_status.push("unsuccessful");
    }
    Logger.info("CleanUpRepository.cleanUp() - @Result - \n", result);
    this.connection.end();
    return result;
  }

  query(query) {
    Logger.info("CleanUpRepository.query() - @query - ", query);
    return new Promise((resolve, reject) => {
      this.connection.query(query, (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
        // this.connection.end();
      });
    });
  }
}

module.exports = new CleanUpRepository();
