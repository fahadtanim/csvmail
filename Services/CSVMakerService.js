const fastcsv = require("fast-csv");
const fs = require("fs");
const Logger = require("./LoggerService");
class CSVMakerService {
  makeCSV(data, input_file_name = "out") {
    Logger.info(
      "CSVMakerService.makeCSV() - Come to CSVMakerService's makeCSV method"
    );
    const fileName =
      "./Assets/" + input_file_name + "_" + new Date().getTime() + ".csv";
    Logger.debug(
      "CSVMakerService.makeCSV() - @data - \n",
      data,
      "\n@input_file_name - ",
      input_file_name,
      "\n@fileName",
      fileName
    );
    const ws = fs.createWriteStream(fileName);
    fastcsv.write(data, { headers: true }).pipe(ws);
    Logger.info("CSVMakerService.makeCSV() - CSV File Write is Done");
    return fileName;
  }
}

module.exports = new CSVMakerService();
