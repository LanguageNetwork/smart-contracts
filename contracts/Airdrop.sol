/*
Copyright 2017 OmiseGO Pte Ltd
Edited version of https://github.com/omisego/airdrop by LangNet.io

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */

pragma solidity ^0.4.23;

import "./openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "./openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Airdrop is Ownable {

    function multisend(address _tokenAddr, address[] dests, uint256[] values) onlyOwner public returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
            ERC20(_tokenAddr).transfer(dests[i], values[i]);
            i += 1;
        }
        return(i);
    }
}