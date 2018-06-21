/* 
* @title LanguageToken
* @author dongsamb, LangNet.io (The Language Network)
* @license GPL-3.0
* @link https://github.com/LanguageNetwork/smart-contracts
* @caution WIP, PoC version
*/

pragma solidity ^0.4.23;

import "./openzeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";
import "./InflationToken.sol";
// import "./AtomicSwapToken.sol";

contract LanguageToken is InflationToken, ERC827Token { // TODO: add AtomicSwapToken
    string public constant name = "Language Token";
    string public constant symbol = "LANG";
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 4000000000 * (10 ** uint256(decimals));  // test input, TBD

    constructor(uint256 _annualInflationRate, uint256 _inflationPeriod, uint256 _inflationStartTime, uint256 _inflationCallRewardAmount) public
    InflationToken(_annualInflationRate, _inflationPeriod, decimals, _inflationStartTime, _inflationCallRewardAmount) {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}