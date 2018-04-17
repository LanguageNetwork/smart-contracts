var LanguageToken = artifacts.require("./LanguageToken.sol");
var LanguageTokenICO = artifacts.require("./LanguageTokenICO.sol");

var start = new Date().valueOf() + 60; // sample data, TBD 
var end = start + (60 * 60 * 24 * 24); // sample data, TBD 
var rate;  // TBD
var wallet = web3.eth.accounts[0]
console.log(wallet);
var hardcap; // TBD
var softcap; // TBD

module.exports = function(deployer) {
    deployer.deploy(LanguageToken).then(function() {
        return deployer.deploy(LanguageTokenICO, start, end, rate, wallet, hardcap, LanguageToken.address, softcap)
    });
};