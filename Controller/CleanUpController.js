const CleanUpService = require("../Services/CleanUpService");
const Logger = require("../Services/LoggerService");
class CleanUpController {
  async clean(request, response) {
    Logger.info("CleanUpController.clean() - CleanUpController clean Method");
    response.send(await CleanUpService.cleanUp());
  }
}

module.exports = new CleanUpController();
