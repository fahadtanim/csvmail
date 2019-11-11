const DBDataRepository = require("../Data/DBDataRepository");
class DBDataService {
  async getDBData(data) {
    let querryData = await DBDataRepository.getQuerryData(
      data.db_credentials,
      data.querry
    );

    return querryData;
  }
}

module.exports = new DBDataService();
