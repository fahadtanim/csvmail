const DBConnect = require("./DBConnect");
const appConfig = require("../appConfig");
class CleanUpRepository {
  async report(credentials, query) {
    this.connection = DBConnect.getConnection(credentials);
    let result = await this.query(query);
    this.connection.end();
    return result;
  }

  query(query) {
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
