/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Token at 0x1fd4B5A62d33bE9e5b4d4193B99e561C2e6c9b6d
*/
pragma solidity ^0.4.2;
contract Token {
    address public issuer;
    mapping (address => uint) public balances;

    function Token() {
        issuer = msg.sender;
        balances[issuer] = 1000000;
    }

    function transfer(address _to, uint _amount) {
        if (balances[msg.sender] < _amount) {
            throw;
        }

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}