pragma solidity ^0.4.23;

import "./InflationToken.sol";

contract LanguageToken is InflationToken {
    string public constant name = "Language Token";
    string public constant symbol = "LANG";
    uint8 public constant decimals = 18;
    //uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));
    uint256 public constant INITIAL_SUPPLY = 4000000000 * (10 ** uint256(decimals));

    function LanguageToken(uint256 _annualInflationRate, uint256 _inflationPeriod, uint256 _inflationStartTime, uint256 _inflationCallRewardAmount) public
    InflationToken(_annualInflationRate, _inflationPeriod, decimals, _inflationStartTime, _inflationCallRewardAmount) {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}