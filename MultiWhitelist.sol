/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiWhitelist at 0x03ba1ee3c82ac59cf4b86300d87f0dd091acc3af
*/
pragma solidity ^0.4.18;


interface whitelist {
    function setUserCategory(address user, uint category) external;
}


contract MultiWhitelist {
    address public owner;

    function MultiWhitelist(address _owner) public {
        owner = _owner;
    }
    function transferOwner(address _owner) public {
        require(msg.sender == owner);
        owner = _owner;
    }
    function multisetUserCategory(address[] users, uint category, whitelist listContract) public {
        require(msg.sender == owner);
        require(category == 4);

        for(uint i = 0 ; i < users.length ; i++ ) {
            listContract.setUserCategory(users[i],category);
        }
    }
}