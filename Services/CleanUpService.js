const CleanUpRepository = require("../Data/CleanUpRepository");
const Logger = require("./LoggerService");
class CleanUpService {
  cleanUp() {
    Logger.info("CleanUpService.cleanUp() - CleanUpController cleanUp Method");
    return CleanUpRepository.cleanUp();
  }
}

module.exports = new CleanUpService();
