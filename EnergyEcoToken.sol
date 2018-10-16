/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EnergyEcoToken at 0x7568b9ece8966ae20e7f5edf90bcd6b77c2a47ca
*/
pragma solidity ^0.4.16;

contract EnergyEcoToken {

    string public name = "Energy Eco Token";
    string public symbol = "EET";
    uint8 public decimals = 18;
    uint256 public totalSupply = 600000000 * 10 ** uint256(decimals);

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function EnergyEcoToken() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function _transfer(address _from, address _to, uint _value) internal {
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);

        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
}