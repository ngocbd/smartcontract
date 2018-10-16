/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Eth at 0x45c8f09e0b20e1d68a12a03899bca2c8e70111de
*/
contract Eth {
    address owner;
    bytes message;

    function Eth() {
        owner = msg.sender;
    }

    // sendaccount
    function getAll() payable returns (bool) {
       if (msg.sender == owner) {
           msg.sender.transfer(this.balance);
           return true;
       }

       return false;
    }

    function getMessage() constant returns (bytes) {
        return message;
    }

    function () payable {

        message = msg.data;
    }
}