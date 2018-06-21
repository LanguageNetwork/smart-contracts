/* 
* @title MathUtils
* @author dongsamb, LangNet.io (The Language Network)
* @license GPL-3.0
* @link https://github.com/LanguageNetwork/smart-contracts
* @caution WIP, PoC version
*/

pragma solidity ^0.4.23;

library MathUtils {

    function ceil(uint256 input, uint256 decimals) pure internal returns (uint256) {
        uint256 target = 10 ** decimals;
        require(input > target);
        return ((input + target - 1) / target) * target;
    }

    function round(uint256 input, uint256 decimals) pure internal returns (uint256) {
        uint256 target = 10 ** decimals;
        require(input > target);
        return (input / target) * target;
    }

    function roundOff(uint256 input, uint256 decimals) pure internal returns (uint256) {
        uint256 target = 10 ** decimals;
        require(input > target);
        if ( input % target >= 5 * target / 10 ) {
            return ((input + target - 1) / target) * target;
        }
        else {
            return (input / target) * target;
        }
    }
}