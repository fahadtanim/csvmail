let nodemailer = require("nodemailer");
const Logger = require("./LoggerService");
class MailService {
  async mailWithAttachment(mail_details) {
    Logger.info(
      "MailService.mailWithAttachment() - Come to MailService's mailWithAttachment Method"
    );

    Logger.debug(
      "MailService.mailWithAttachment() - @Mail Details - \n",
      mail_details
    );
    let transporter = nodemailer.createTransport({
      host: mail_details.mail_server,
      port: mail_details.port,
      secure: mail_details.secure,
      auth: {
        user: mail_details.authentication.email,
        pass: mail_details.authentication.password
      }
    });

    Logger.debug(
      "MailService.mailWithAttachment() - @Transporter - \n",
      transporter
    );

    let mailOptions = {
      from: mail_details.authentication.email,
      to: mail_details.mail_to,
      subject: mail_details.mail_subject,
      html: mail_details.mail_body,
      attachments: [
        {
          path: appRoot + "/Assets/" + mail_details.file
        }
      ]
    };

    Logger.debug(
      "MailService.mailWithAttachment() - @Mail Options - \n",
      mailOptions
    );

    let res = {};
    try {
      Logger.info("MailService.mailWithAttachment() - Trying to Send Mail");
      let result = await transporter.sendMail(mailOptions);
      Logger.debug("MailService.mailWithAttachment() - @Result - \n", result);
      res = {
        status: "successful",
        message: ""
      };
      // console.log(result);
    } catch (error) {
      Logger.error(
        "MailService.mailWithAttachment() - Error - While Sending Mail"
      );
      res = {
        status: "unsuccessful",
        message: error
      };
    }
    return res;
  }

  async mail(mail_details) {
    Logger.info("MailService.mail() - Come to MailService's mail Method");

    Logger.debug("MailService.mail() - @Mail Details - \n", mail_details);
    let transporter = nodemailer.createTransport({
      host: mail_details.mail_server,
      port: mail_details.port,
      secure: mail_details.secure,
      auth: {
        user: mail_details.authentication.email,
        pass: mail_details.authentication.password
      }
    });
    Logger.debug("MailService.mail() - @Mail Details - \n", mail_details);

    let mailOptions = {
      from: mail_details.authentication.email,
      to: mail_details.mail_to,
      subject: mail_details.mail_subject,
      html: mail_details.mail_body
    };

    Logger.debug("MailService.mail() - @Mail Options - \n", mailOptions);
    let res = {};
    try {
      Logger.info("MailService.mail() - Trying to Send Mail");
      let result = await transporter.sendMail(mailOptions);
      Logger.debug("MailService.mail() - @Result", result);
      res = {
        status: "successful",
        message: ""
      };
      // console.log(result);
    } catch (error) {
      Logger.error(
        "MailService.mailWithAttachment() - Error - While Sending Mail - \n",
        error
      );
      res = {
        status: "unsuccessful",
        message: error
      };
    }
    return res;
  }
}

module.exports = new MailService();
