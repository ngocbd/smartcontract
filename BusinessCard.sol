/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BusinessCard at 0xce2ab80b21fd5f7527c7eed606a51557045d976f
*/
pragma solidity ^0.4.24;

contract BusinessCard {
    
    address public jeremySchroeder;
    
    string public email;
    string public website;
    string public github;
    string public twitter;
    
    constructor () public {
        jeremySchroeder = msg.sender;
        email = 'jeremy.schroeder@protonmail.ch';
        website = 'https://spudz.org';
        github = 'https://github.com/spdz';
        twitter = 'https://twitter.com/_spdz';
    }
}