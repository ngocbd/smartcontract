/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GOLD at 0x1133fcf62407ec316816ec69e0ee2b4910b9a27d
*/
pragma solidity ^0.4.18;

contract GOLD {
    string public name = "GOLD";
    string public symbol = "GOLD";
    uint8 public decimals = 0;
    uint256 public totalSupply = 30000000;
    mapping (address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);
    function GOLD() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[msg.sender] + balanceOf[_to];
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
        assert(balanceOf[msg.sender] + balanceOf[_to] == previousBalances);
    }

}