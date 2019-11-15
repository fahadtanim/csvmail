module.exports = {
  logger_level: "info", // all || info || debug || warn || error || off
  database: {
    host: "localhost",
    username: "root",
    password: "",
    database_name: "mm"
  },
  clean_up_queries: [
    // "DROP database mm"
    "delete from ticket_item",
    "delete from transactions",
    "delete from ticket_coupon_discount",
    "delete from ticket_properties",
    "delete from ticket_item_cooking_instruction",
    "delete from ticket_table_num",
    "delete from ticket",
    "commit"
  ],
  mail_details: {
    mail_server: "smtp.gmail.com",
    port: "587",
    secure: false,
    authentication: {
      email: "fahad.tanim.info@gmail.com",
      password: "aaAA123@"
    },
    subject: (from_date, to_date) => {
      return `Report from ${from_date} to ${to_date}`;
    },
    body: (mail_body, from_date, to_date) => {
      return `There is the report generated from ${from_date} to ${to_date}.
      ${mail_body}
      Thanks
      `;
    },
    mail_to: "fahadtanim@gmail.com,fahad.khan@dsinnovators.com"
  }
};
