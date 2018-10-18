/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EmailRegistry at 0x6c6fc67bc549e31343297a5f892c5eb52f2e665b
*/
pragma solidity ^0.4.18; // solhint-disable-line



contract EmailRegistry {
    mapping (address => string) public emails;
    address [] public registeredAddresses;
    function registerEmail(string email) public{
        require(bytes(email).length>0);
        //if previously unregistered, add to list
        if(bytes(emails[msg.sender]).length==0){
            registeredAddresses.push(msg.sender);
        }
        emails[msg.sender]=email;    
    }
    function numRegistered() public constant returns(uint count) {
        return registeredAddresses.length;
    }
}