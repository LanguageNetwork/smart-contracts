/* 
* @title LanguageTokenCrowdsale
* @author dongsamb, LangNet.io (The Language Network)
* @license GPL-3.0
* @link https://github.com/LanguageNetwork/smart-contracts
* @caution WIP, PoC version
*/

pragma solidity ^0.4.23;

import "./openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "./openzeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "./openzeppelin-solidity/contracts/crowdsale/validation/WhitelistedCrowdsale.sol";
import "./LanguageToken.sol";

contract LanguageTokenCrowdsale is CappedCrowdsale, RefundableCrowdsale, WhitelistedCrowdsale {
    // uint256 _rate = 2; // test input, TBD
    // address _wallet = msg.sender;
    // ERC20 _token = new LanguageToken();
    constructor(uint256 _rate, address _wallet, uint256 _cap, ERC20 _token, uint256 _goal) public
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    RefundableCrowdsale(_goal) {
        // TBD the value to less or equal than a cap which is limit for accepted funds
        require(_goal <= _cap);
    }
}