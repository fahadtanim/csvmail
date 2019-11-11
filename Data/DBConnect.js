const mysql = require("mysql");

class DBConnect {
  getConnection(credentials) {
    return mysql.createConnection({
      host: credentials.host,
      user: credentials.username,
      password: credentials.password,
      database: credentials.database_name
    });
  }
}

module.exports = new DBConnect();
