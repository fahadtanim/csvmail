const ReportRepository = require("../Data/ReportRepository");
const CSVMakerService = require("./CSVMakerService");
const MailService = require("./MailService");
const appConfig = require("../appConfig");
const Logger = require("./LoggerService");
class ReportService {
  async report(from_date, to_date) {
    Logger.info(
      "ReportService.report() - Come to ReportService's report Method"
    );
    Logger.debug(
      "ReportService.report() - @From Date - ",
      from_date,
      "@To Date - ",
      to_date
    );
    let report_query = `select ti.ITEM_NAME as ITEM_NAME, ti.ITEM_PRICE as ITEM_PRICE, sum(ti.ITEM_COUNT) as ITEM_COUNT, sum(ti.SUB_TOTAL) as SUB_TOTAL
    from ticket_item ti, ticket t  where
    t.ID = ti.TICKET_ID and
    t.CREATE_DATE >= "${from_date} 00:00:00" and
    t.CREATE_DATE <= "${to_date} 23:59:59"
    group by ti.ITEM_NAME
    order by ti.ITEM_NAME asc`;
    let total_query = `select sum(ti.SUB_TOTAL) as SUB_TOTAL
    from ticket_item ti, ticket t  where
    t.ID = ti.TICKET_ID and
    t.CREATE_DATE >= "${from_date} 00:00:00" and
    t.CREATE_DATE <= "${to_date} 23:59:59"`;
    Logger.debug(
      "ReportService.report() - @Report Query - \n",
      report_query,
      "\n@Total Query - \n",
      total_query
    );
    let result = await ReportRepository.report(
      appConfig.database,
      report_query
    );
    Logger.debug(
      "ReportService.report() - @Result from ReportRepository's report method - \n",
      result
    );

    if (result.length === 0) {
      Logger.info("ReportService.report() - Come to Empty Result Block");
      let mail_details = appConfig.mail_details;
      let msg_body = `SUB_TOTAL is 0`;
      mail_details.mail_subject = mail_details.subject(from_date, to_date);
      mail_details.mail_body = mail_details.body(msg_body, from_date, to_date);
      Logger.debug("ReportService.report() - @Mail Details - \n", mail_details);
      try {
        let res = await MailService.mail(mail_details);
        Logger.debug(
          "ReportService.report() - @Result from MailService's mail Method",
          res
        );
        return {
          status: 204,
          mail_sent: res.status,
          message: res.message
        };
      } catch (err) {
        Logger.error(
          "ReportService.report() - Error - thrown from MailService's mail Method - \n",
          err
        );
        return {
          status: 204,
          mail_sent: "unsuccessful",
          message: err
        };
      }
    } else {
      Logger.info("ReportService.report() - Come to Result has block");
      let mail_details = appConfig.mail_details;
      let file_name = CSVMakerService.makeCSV(result, "report");
      file_name = file_name.split("/")[2];
      let sub_total = await ReportRepository.report(
        appConfig.database,
        total_query
      );
      //   sub_total.push()
      let msg_body = `SUB_TOTAL is ${sub_total[0].SUB_TOTAL}`;
      mail_details.mail_subject = mail_details.subject(from_date, to_date);
      mail_details.mail_body = mail_details.body(msg_body, from_date, to_date);
      mail_details.file = file_name;
      Logger.debug("ReportService.report() - @Mail Details", mail_details);
      try {
        let res = MailService.mailWithAttachment(mail_details);
        Logger.debug(
          "ReportService.report() - @Result from MailService's mail Method - \n",
          res
        );
        return {
          status: 204,
          mail_sent: res.status,
          message: res.message
        };
      } catch (error) {
        Logger.error(
          "ReportService.report() - Error - thrown from MailService's mail Method - \n",
          err
        );
        return {
          status: 200,
          mail_sent: "unsuccessful",
          message: err
        };
      }
    }
  }
}

module.exports = new ReportService();
