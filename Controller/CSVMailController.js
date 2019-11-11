const CSVMailService = require("../Services/CSVMailServices");

class CSVMailController {
  async mailCSV(request, response) {
    let data = request.body;
    let res = await CSVMailService.createCSVandMail(data);

    response.send(res);
  }
}

module.exports = new CSVMailController();
