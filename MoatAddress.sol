/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MoatAddress at 0x8836dc78baa218017dcc0cf6ced6669614b9dd9b
*/
pragma solidity ^0.4.24;

interface token {
    function transfer(address receiver, uint amount) external returns (bool);
    function balanceOf(address who) external returns (uint256);
}

contract MoatAddress {

    event eSetAddr(string AddrName, address TargetAddr);

    mapping(bytes32 => address) internal addressBook;

    modifier onlyAdmin() {
        require(msg.sender == getAddr("admin"));
        _;
    }

    constructor() public {
        addressBook[keccak256("owner")] = msg.sender;
        addressBook[keccak256("admin")] = msg.sender;
    }

    function setAddr(string AddrName, address Addr) public {
        require(
            msg.sender == getAddr("owner") ||
            msg.sender == getAddr("admin")
        );
        addressBook[keccak256(AddrName)] = Addr;
        emit eSetAddr(AddrName, Addr);
    }

    function getAddr(string AddrName) public view returns(address AssignedAddress) {
        address realAddress = addressBook[keccak256(AddrName)];
        require(realAddress != address(0));
        return realAddress;
    }

    function SendERC20ToAsset(address tokenAddress) onlyAdmin public {
        token tokenFunctions = token(tokenAddress);
        uint256 tokenBal = tokenFunctions.balanceOf(address(this));
        tokenFunctions.transfer(getAddr("asset"), tokenBal);
    }

}