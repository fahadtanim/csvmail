const DBDataService = require("../Services/DBDataService");

class DBDataController {
  async getData(request, response) {
    let data = request.body;
    let res = {};
    try {
      res.data = await DBDataService.getDBData(data);
      res.status = "successful";
      res.message = "";
    } catch (err) {
      res.data = {};
      res.status = "unsuccessful";
      res.message = err;
    }
    response.send(res);
  }
}

module.exports = new DBDataController();
