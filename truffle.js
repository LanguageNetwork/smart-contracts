var HDWalletProvider = require("truffle-hdwallet-provider");  
// npm install truffle-hdwallet-provider

var mnemonic = "opinion destroy betray ..."; // 12 word mnemonic

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 18545,
      network_id: "*" // match any network  ex) 5777, 1, 3
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/", 0), 
      // mnemonic, host, hd wallet index
      network_id: 3,
      gas: 4600000
    }
    // live: {
    //   host: "178.25.19.88", // Random IP for example purposes (do not use)
    //   port: 80,
    //   network_id: 1,        // Ethereum public network
    //   // optional config values:
    //   // gas
    //   // gasPrice
    //   // from - default address to use for any transaction Truffle makes during migrations
    //   // provider - web3 provider instance Truffle should use to talk to the Ethereum network.
    //   //          - function that returns a web3 provider instance (see below.)
    //   //          - if specified, host and port are ignored.
    // }
  }
};