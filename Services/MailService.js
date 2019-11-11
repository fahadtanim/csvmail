let nodemailer = require("nodemailer");

class MailService {
  async mailWithAttachment(mail_details) {
    let transporter = nodemailer.createTransport({
      host: mail_details.mail_server,
      port: mail_details.port,
      secure: mail_details.secure,
      auth: {
        user: mail_details.authentication.email,
        pass: mail_details.authentication.password
      }
    });

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

    let res = {};
    try {
      await transporter.sendMail(mailOptions);
      res = {
        status: "successful",
        message: ""
      };
      // console.log(result);
    } catch (error) {
      res = {
        status: "unsuccessful",
        message: error
      };
    }
    return res;
  }
}

module.exports = new MailService();
