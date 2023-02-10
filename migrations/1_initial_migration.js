const Decentralizedskillapp = artifacts.require('Decentralizedskillapp');

// Deploys the smart contract "Decentralizedskillapp"
module.exports = function (deployer) {
    deployer.deploy(Decentralizedskillapp);
}