const DBConnect = require("./DBConnect");
const Logger = require("../Services/LoggerService");
class DBDataRepository {
  constructor() {
    this.connection = {};
  }
  getQueryData(credentials, query) {
    Logger.info(
      "DBDataService.getDBData() - Come to DBDataService's getDBData Method"
    );

    Logger.debug(
      "DBDataService.getDBData() - @credentials - \n",
      credentials,
      "\n@query - \n",
      query
    );
    this.connection = DBConnect.getConnection(credentials);
    Logger.debug(
      "DBDataService.getDBData() - @connection - \n",
      this.connection
    );
    return new Promise((resolve, reject) => {
      this.connection.query(query, (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
      });
    });
  }
}

module.exports = new DBDataRepository();
