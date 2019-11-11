const DBConnect = require("./DBConnect");

class CSVDataRepository {
  constructor() {
    this.connection = {};
  }
  getQuerryData(credentials, querry) {
    // console.log("credentials", credentials, "querry", querry);
    this.connection = DBConnect.getConnection(credentials);
    // console.log(this.connection);
    return new Promise((resolve, reject) => {
      this.connection.query(querry, (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
        // this.connection.end();
      });
    });
  }
}

module.exports = new CSVDataRepository();
