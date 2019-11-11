const express = require("express");
const CSVMailRouter = require("./Routers/CSVMailRouter");
const DBDataRouter = require("./Routers/DBDataRouter");
const path = require("path");
global.appRoot = path.resolve(__dirname);
const app = express();

const PORT = process.env.PORT || 5000;

app.use(express.json());

app.use("/api/v1/csvmail", CSVMailRouter);
app.use("/api/v1/dbdata", DBDataRouter);

//#######################################
//###########  SERVER START  ############
//#######################################

app.listen(PORT, () => {
  console.log("server started!! Port : " + PORT);
  //   console.log(app_config.port);
});

//#######################################
//###########  SERVER END  ##############
//#######################################
