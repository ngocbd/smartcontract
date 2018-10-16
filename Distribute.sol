/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Distribute at 0x84004ca3b679b94d5c27c59d710e8201068bb93b
*/
pragma solidity ^0.4.0;
contract Distribute {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    //????  
    function transferETHS(address[] _tos) payable public returns(bool) {
        require(_tos.length > 0);
        uint val = this.balance / _tos.length;
        for (uint32 i = 0; i < _tos.length; i++) {
            _tos[i].transfer(val);
        }
        return true;
    }

    function () payable public {
        owner.transfer(this.balance);
    }
}