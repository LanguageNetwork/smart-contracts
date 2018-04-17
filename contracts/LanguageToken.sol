pragma solidity ^0.4.21;

import "./zeppelin-solidity/token/ERC20/BurnableToken.sol";

contract LanguageToken is BurnableToken {

    string public constant name = "LANG Token";
    string public constant symbol = "LANG";
    uint8 public constant decimals = 18;
}