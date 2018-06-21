/* 
* @title AtomicSwapToken
* @author dongsamb, LangNet.io (The Language Network)
* @license GPL-3.0
* @link https://github.com/LanguageNetwork/smart-contracts
* @caution WIP, PoC version
*/

pragma solidity ^0.4.23;

import "./openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
// import "./openzeppelin-solidity/contracts/math/SafeMath.sol";
// import "./MathUtils.sol";

contract AtomicSwapToken is StandardToken {
    // using SafeMath for uint256;
    // using MathUtils for uint256;
    // event deposit(uint256);
    ERC20 token;
    // start time
    uint256 OpenValue;

    enum State {
        None,
        Open,
        Done,
        Canceled
    }
    
    struct Swap {
        address initiator;
        address participant;
        uint256 initiatorValue;
        uint256 participantValue;
        bytes32 key;
        bytes32 hashLock;
        uint256 timeLock;
        uint initTime;
        State state;
    }

    mapping(bytes32 => Swap) private swaps;  // or public

    // events

    
    constructor(ERC20 _token) public {
        token = _token;
    }

    function checkExist(bytes32 _hashLock) public view returns (bool) {
        return swaps[_hashLock].initiator != address(0);
    }

    function open(address _participant, uint256 _initiatorValue, uint256 _participantValue, bytes32 _hashLock, uint256 _timeLock) public {
        require(!checkExist(_hashLock));
        swaps[_hashLock] = Swap(
            msg.sender,
            _participant,
            _initiatorValue,
            _participantValue,
            0x0,
            _hashLock,
            _timeLock,
            now,
            State.Open
        );
        // TBD

    }
    
    function redeem(bytes32 _hashLock, bytes32 _key) public {
        require(!checkExist(_hashLock));
        require(checkHashLock(_hashLock, _key));
        require(checkTimeLock(_hashLock));
        require(checkOpenValue());

        // TBD
    }

    function revert(bytes32 _hashLock) public {
        // TBD
    }

    function checkOpenValue() public view returns (bool) {
        return OpenValue <= address(this).balance;
        // TBD
    }

    function checkHashLock(bytes32 _hashLock, bytes32 _key) public pure returns (bool) {
        return keccak256(_key) == _hashLock;
    }

    function checkTimeLock(bytes32 _hashLock) public view returns (bool) {
        return block.timestamp <= (swaps[_hashLock].initTime + swaps[_hashLock].timeLock);
    }

    // modifier checkHashLock(bytes32 _hashLock, bytes32 _key) {
    //     require(keccak256(_key) == _hashLock);
    //     // TBD
    //     _;
    // }

    // modifier checkTimeLock(bytes32 _hashLock) {
    //     require(block.timestamp <= swaps[_hashLock].initTime + swaps[_hashLock].timeLock);
    //     // TBD
    //     _;
    // }

    // TBD


    // // ERC165
    // bytes4 constant InterfaceSignatureERC165 =
    //     bytes4(keccak256('openSwap(uint256, uint256, address)')) ^
    //     bytes4(keccak256('redeem(bytes32)')) ^
    //     bytes4(keccak256('Otherfunctions()')) ^
    //     ...
    
}