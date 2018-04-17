pragma solidity ^0.4.21;

import "./zeppelin-solidity/crowdsale/validation/CappedCrowdsale.sol";
import "./zeppelin-solidity/crowdsale/distribution/RefundableCrowdsale.sol";

contract LanguageTokenICO is CappedCrowdsale, RefundableCrowdsale {
    function LanguageTokenICO(uint256 _openingTime, uint256 _closingTime, uint256 _rate, address _wallet, uint256 _cap, ERC20 _token, uint256 _goal) public
        Crowdsale(_rate, _wallet, _token)
        CappedCrowdsale(_cap)
        TimedCrowdsale(_openingTime, _closingTime)
        RefundableCrowdsale(_goal)
    {
    // TBD the value to less or equal than a cap which is limit for accepted funds
        require(_goal <= _cap);
    }
}