const CSVMailService = require("../Services/CSVMailServices");

class CSVMailController {
  async mailCSV(request, response) {
    Logger.info(
      "CSVMailController.mailCSV() - CSVMailController mailCSV Method"
    );
    let data = request.body;
    Logger.debug("CSVMailController.mailCSV() - @Data - \n", data);
    let res = await CSVMailService.createCSVandMail(data);
    Logger.debug("CSVMailController.mailCSV() - @Result - \n", res);
    response.send(res);
  }
}

module.exports = new CSVMailController();
