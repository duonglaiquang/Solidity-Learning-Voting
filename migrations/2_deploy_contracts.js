//require the contract we created, assign it to a variable then add it to the manifest of deployed contract to ensure it gets deployed when we run the migration

var Election = artifacts.require("./Election.sol");

module.exports = function (deployer) {
    deployer.deploy(Election);
};