const DBConnect = require("./DBConnect");
const Logger = require("../Services/LoggerService");
class CSVDataRepository {
  constructor() {
    this.connection = {};
  }
  getQueryData(credentials, query) {
    // console.log("credentials", credentials, "query", query);
    Logger.debug(
      "CSVDataRepository.getQueryData() - @Credentials - \n",
      credentials,
      "@Query - ",
      query
    );
    this.connection = DBConnect.getConnection(credentials);
    Logger.debug(
      "CSVDataRepository.getQueryData() - @Connection - \n",
      this.connection
    );
    return new Promise((resolve, reject) => {
      this.connection.query(query, (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
        // this.connection.end();
      });
    });
  }
}

module.exports = new CSVDataRepository();
