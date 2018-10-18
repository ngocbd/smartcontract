/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WinTokenLock at 0xfb1d8b983641e57bae37c4fd68ff16551c4be061
*/
pragma solidity ^0.4.21;

contract WinchainInterface {
    function balanceOf(address _owner) public constant returns (uint256 balance);
}

contract WinTokenLock {
    string public name = "WinTokenLock";
    string public symbol = "WINLOCK";

    // 2020-09-28 00:00:00
    uint256 constant deadlineToFreedTeamPool = 1601222400;

    address winToken;

    //
    event Withdraw(address indexed from, uint256 value);

    // ??????
    address receiverAddress = 0xbAfeDa001a601e872c2e1d1263530D8fd8F3F61A;

    function WinTokenLock() public {
        // winToken?????
        winToken = 0xbfaa8cf522136c6fafc1d53fe4b85b4603c765b8;
    }

    function() public {
    }

    function withdraw() public returns (bool success) {
        uint value = WinchainInterface(winToken).balanceOf(address(this));
        bytes4 methodId = bytes4(keccak256("transfer(address,uint256)"));

        require(value > 0);
        require(block.timestamp >= deadlineToFreedTeamPool);
        require(winToken.call(methodId, receiverAddress, value));

        emit Withdraw(receiverAddress, value);
        return true;
    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return WinchainInterface(winToken).balanceOf(_owner);
    }

    function balanceOf() public constant returns (uint256 balance) {
        return WinchainInterface(winToken).balanceOf(address(this));
    }
}