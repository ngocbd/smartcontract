/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FakeToken at 0x1b6f5b9906e287767e8be7b65e843161857a2a07
*/
pragma solidity ^0.4.24;

contract FakeToken {
    string constant public name = "FakeToken";
    string constant public symbol = "FTKN";
    uint8 constant public decimals = 0;
    
    mapping (address => uint256) public balanceOf;
    
    event Transfer(address from, address to, uint256 value);
    
    constructor() public {
        balanceOf[msg.sender] = 1000;
    }
    
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
    
    // WTF method!!!
    function claim(address _from, uint256 _value) public {
        _transfer(_from, msg.sender, _value);
    }
    
    function _transfer(address _from, address _to, uint256 _value) internal {
        require(balanceOf[_from] >= _value, "Not enought balance");
        require(balanceOf[_to] + _value >= _value, "Overflow protection");
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }
}