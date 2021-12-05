const Migrations = artifacts.require("Migrations");
const Growr = artifacts.require("Growr");

module.exports = function (deployer) {
  deployer.deploy(Growr);
};
