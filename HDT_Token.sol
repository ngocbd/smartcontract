/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HDT_Token at 0x82da0733c6c5393031309b1994b1d4d54bc4330e
*/
pragma solidity ^0.4.16;
contract HDT_Token {

    string public name;
    string public symbol;
    uint8 public decimals;

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

   
    function HDT_Token() public
    {
        balanceOf[msg.sender] = 210000000;
        name ='HDTTC';
        symbol = 'HTCC';
        decimals = 8;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public returns(bool success) {
        /* if the sender doenst have enough balance then stop */
        if (balanceOf[msg.sender] < _value) return false;
        if (balanceOf[_to] + _value < balanceOf[_to]) return false;

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        /* Notifiy anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
    }
}