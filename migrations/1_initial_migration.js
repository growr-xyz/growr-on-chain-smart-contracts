const Migrations = artifacts.require("Migrations");
const Growr = artifacts.require("Growr");
const LendingPool = artifacts.require("LendingPool");

module.exports = function (deployer) {
  //deployer.deploy(Growr);
  deployer.deploy(LendingPool);
};
