/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract generic_holder at 0xea88C23690b9F12ac6941E8a229aa4f94C72B8Db
*/
pragma solidity ^0.4.15;

contract generic_holder {
    address owner;
    
    modifier onlyowner {
        require(msg.sender == owner);
        _;
    }
    
    // constructor
    function generic_holder() {
        owner = msg.sender;
    }
    
    function change_owner(address new_owner) external onlyowner {
        owner = new_owner;
    }
    
    function execute(address _to, uint _value, bytes _data) external onlyowner payable returns (bool){
        return _to.call.value(_value)(_data);
    }

    function send(address _to) external onlyowner payable returns (bool){
        return _to.call.gas(300000).value(msg.value)();
    }
    
    function get_owner() constant returns (address) {
        return owner;
    }
    
}