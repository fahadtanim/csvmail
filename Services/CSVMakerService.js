const fastcsv = require("fast-csv");
const fs = require("fs");
class CSVMakerService {
  makeCSV(data) {
    const fileName = "./Assets/out_" + new Date().getTime() + ".csv";
    const ws = fs.createWriteStream(fileName);
    fastcsv.write(data, { headers: true }).pipe(ws);
    return fileName;
  }
}

module.exports = new CSVMakerService();
