const CSVDataRepository = require("../Data/CSVDataRepository");
const CSVMakerService = require("./CSVMakerService");
const MailService = require("./MailService");
class CSVMailServices {
  async createCSVandMail(data) {
    Logger.info(
      "CSVMailServices.createCSVandMail() - CSVMailServices's createCSVandMail Method"
    );
    Logger.debug("CSVMailServices.createCSVandMail() - @Data - \n", data);
    let querryData = await CSVDataRepository.getQueryData(
      data.db_credentials,
      data.querry
    );
    Logger.debug(
      "CSVMailServices.createCSVandMail() - @Querry Data - \n",
      querryData
    );
    // console.log(querryData);
    let filePath = CSVMakerService.makeCSV(querryData);
    let fileName = filePath.split("/");
    // console.log(fileName);
    data.mail_details.file = fileName[2];
    Logger.debug(
      "CSVMailServices.createCSVandMail() - @Generated File - \n Assets",
      fileName
    );
    let result = await MailService.mailWithAttachment(data.mail_details);
    Logger.debug("CSVMailServices.createCSVandMail() - @Result - \n", result);
    return result;
  }
}

module.exports = new CSVMailServices();
