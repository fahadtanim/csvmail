const CSVDataRepository = require("../Data/CSVDataRepository");
const CSVMakerService = require("./CSVMakerService");
const MailService = require("./MailService");
class CSVMailServices {
  async createCSVandMail(data) {
    let querryData = await CSVDataRepository.getQuerryData(
      data.db_credentials,
      data.querry
    );
    // console.log(querryData);
    let filePath = CSVMakerService.makeCSV(querryData);
    let fileName = filePath.split("/");
    // console.log(fileName);
    data.mail_details.file = fileName[2];
    let result = await MailService.mailWithAttachment(data.mail_details);
    return result;
  }
}

module.exports = new CSVMailServices();
