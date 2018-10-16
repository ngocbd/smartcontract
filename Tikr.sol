/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Tikr at 0x5f63a1e6f8c772c5887f2bb50f35380f6d05386b
*/
pragma solidity ^0.4.21;

contract Tikr {

    mapping (bytes32 => uint256) tokenValues;
    address adminAddress;
    address managerAddress;

    constructor () public {
        adminAddress = msg.sender;
        managerAddress = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == adminAddress);
        _;
    }

    modifier onlyManager() {
        require(msg.sender == managerAddress);
        _;
    }

    function updateAdmin (address _adminAddress) public onlyAdmin {
        adminAddress = _adminAddress;
    }

    function updateManager (address _managerAddress) public onlyAdmin {
        managerAddress = _managerAddress;
    }

    function getPrice (bytes32 _ticker) public view returns (uint256) {
        return tokenValues[_ticker];
    }

    function updatePrice (bytes32 _ticker, uint256 _price) public onlyManager {
        tokenValues[_ticker] = _price;
    }

}