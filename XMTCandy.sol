/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract XMTCandy at 0x5298b1ba0f01f9db9955d5fdc87adfeaf054eafa
*/
pragma solidity ^0.4.20;
interface token { function transfer(address _to, uint _value) public; }

contract XMTCandy {
    function () payable public {
        msg.sender.transfer(msg.value);
        token(0xE5C943Efd21eF0103d7ac6C4d7386E73090a11af).transfer(msg.sender, 10000000000000000000000);
    }
}