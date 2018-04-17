var LanguageToken = artifacts.require("./LanguageToken.sol");
var LanguageTokenCrowdsale = artifacts.require("./LanguageTokenCrowdsale.sol");

var start = new Date().valueOf() + 60;  // this is test value, TBD
var end = start + (60 * 60 * 24);  // this is test value, TBD
var rate = 5;  // this is test value, TBD
var wallet = web3.eth.accounts[0]
console.log(wallet);
hardcap = 100000000000;  // this is test value, TBD
softcap = 5000000;  // this is test value, TBD
// 1523949142, 1523952768,  5, "0xca35b7d915458ef540ade6068dfe2f44e8fa733c", 10000000000, "0x692a70d2e424a56d2c6c27aa97d1a86395877b3a", 50000
//1523958515962, 1523958602362, 5, "0xca35b7d915458ef540ade6068dfe2f44e8fa733c", 10000000000000000, "0x692a70d2e424a56d2c6c27aa97d1a86395877b3a", 50000000
module.exports = function(deployer) {
//    deployer.deploy(LanguageToken);
//    deployer.deploy(LanguageTokenCrowdsale);

    deployer.deploy(LanguageToken).then(function() {
        return deployer.deploy(LanguageTokenCrowdsale, start, end, rate, wallet, hardcap, LanguageToken.address, softcap)
    });
};
//
//    deployer.then(function() {
//        return AccessManager.deployed().then(function(instance) {
//            AM = instance;
//            return deployer.deploy(Populous, AM.address);
//        }).then(function() {
//            return Populous.deployed();
//        }).then(function(P) {
//            return AM.changePopulous(P.address);
//        }).then(function() {
//            console.log('Finished deploying Populous');
//        });
//    });
//};