const Migrations = artifacts.require("Migrations");
const GrowrLoan = artifacts.require("GrowrLoan");
const LendingPool = artifacts.require("LendingPool");

module.exports = function (deployer) {
  //deployer.deploy(Growr);
  deployer.deploy(GrowrLoan);
};
