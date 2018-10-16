/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CarlosCoin at 0xf0baaecc516df220be89e135f500ab5e2567edd5
*/
pragma solidity ^0.4.19;

/* Playground and ERC20 testing by Carl Oscar Aaro */
/* https://carloscar.com/ */
contract CarlosCoin {
    string public name = "Carlos Coin";
    string public symbol = "CARLOS";
    uint8 public decimals = 18;

    uint256 public totalSupply = 1000000 * 10 ** uint256(decimals);

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function CarlosCoin() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public {
        require(_to != 0x0);
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
    }
}