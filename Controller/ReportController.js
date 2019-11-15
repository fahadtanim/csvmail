const ReportService = require("../Services/ReportService");
const Logger = require("../Services/LoggerService");
class ReportController {
  async report(request, response) {
    Logger.info("ReportController.report() - ReportController report Method");
    let from_date = request.body.from_date;
    let to_date = request.body.to_date;
    Logger.debug(
      "ReportController.report() - @From Date - ",
      from_date,
      "@To Date - ",
      to_date
    );
    let result = await ReportService.report(from_date, to_date);
    Logger.info(
      "ReportController.report() - Return from Report Service's Report Method"
    );
    Logger.debug(
      "ReportController.report() - @Result from Report Service's Report Method - ",
      result
    );
    response.send(result);
  }
}

module.exports = new ReportController();
