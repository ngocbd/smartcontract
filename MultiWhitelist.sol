/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiWhitelist at 0x342F4057110bE50957d0f156F4939a929944C69e
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
    function multisetUserCategory(address[] users, uint category, whitelist listContract) public {
        require(msg.sender == owner);

        for(uint i = 0 ; i < users.length ; i++ ) {
            listContract.setUserCategory(users[i],category);
        }
    }
}