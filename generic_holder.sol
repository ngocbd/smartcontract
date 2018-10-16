/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract generic_holder at 0x7998b7Fcf30D4aed870635155Cc62Aa55BE96F9A
*/
pragma solidity ^0.4.15;

contract generic_holder {
    address owner;
    
    modifier onlyowner {
        if (owner == msg.sender)
            _;
    }
    
    // constructor
    function generic_holder() {
        owner = msg.sender;
    }
    
    function change_owner(address new_owner) external onlyowner {
        owner = new_owner;
    }
    
    function execute(address _to, uint _value, bytes _data) external onlyowner returns (bool){
        return _to.call.value(_value)(_data);
    }

    function send(address _to, uint _value) external onlyowner returns (bool){
        return _to.send(_value); 
    }
    
    function get_owner() constant returns (address) {
        return owner;
    }
    
}