const LandRegistry = artifacts.require("LandRegistry");
const DigitalIdentity = artifacts.require("DigitalIdentity");
const HealthcareRecords = artifacts.require("HealthcareRecords");
const SupplyChain = artifacts.require("SupplyChain");

module.exports = function (deployer) {
    deployer.deploy(LandRegistry);
    deployer.deploy(DigitalIdentity);
    deployer.deploy(HealthcareRecords);
    deployer.deploy(SupplyChain);
};
