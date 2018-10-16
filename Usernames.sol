/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Usernames at 0x1ef5cc1a76bf3558bfe209a2ea8122e8b4f5ff80
*/
pragma solidity ^0.4.18;

contract Usernames {
    
    mapping(address => string) private usernames;
    mapping(string => int) private dedupeList;
    
    event NewUsername(address indexed _user, string indexed _username);
    
    function Usernames() public {
        
    }
    
    function getUsername(address _user) public view returns (string) {
        return usernames[_user];
    }
    
    function checkDupe(string _userName) public constant returns (int) {
        return dedupeList[_userName];
    }

    function createUsername(string _userName) external returns (bool) {
        require(bytes(usernames[msg.sender]).length == 0);
        require(dedupeList[_userName] == 0);
        require(bytes(_userName).length >= 3 && bytes(_userName).length <= 16);
        
        usernames[msg.sender] = _userName;
        dedupeList[_userName] = 1;
        NewUsername(msg.sender, _userName);
        
        return true;
    }
    
}