/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Admin at 0x5fa498b70de14fa9f7b2a51e973c65346a31b8cc
*/
pragma solidity 0.4.19;

contract Admin {

    address public owner;
    mapping(address => bool) public AdminList;
    
    function Test() public returns (uint256 _balance) {
            
        address sender = msg.sender;
        return sender.balance;
        
    }
    
      function TestX() public {
         
         owner = msg.sender;
        
    }
    
}