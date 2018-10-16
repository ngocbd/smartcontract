/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WhoTheEth at 0x842d6da3097b5efde5a81535144f947ab482b6ee
*/
pragma solidity ^0.4.16;


contract WhoTheEth {
    
    address owner;
    uint public numberOfNames;
    mapping(address => string) public names;
    mapping(address => uint) public bank;

    event AddedName(
        address indexed _address,
        string _name,
        uint _time,
        address indexed _referrer,
        uint _value
    );
    
    function WhoTheEth() public {
        owner = msg.sender;
    }
    
    function pullFunds() public {
        require (bank[msg.sender] > 0);
        uint value = bank[msg.sender];
        bank[msg.sender] = 0;
        msg.sender.transfer(value);
    }
    
    function setName(string newName) payable public {
        require(msg.value >= 1 finney || numberOfNames < 500);
        numberOfNames++;
        names[msg.sender] = newName;
        bank[owner] += msg.value;
        AddedName(msg.sender, newName, now, owner, msg.value);
    }
    
        
    function setNameRefer(string newName, address ref) payable public {
        require(msg.value >= 1 finney || numberOfNames < 500);
        require(msg.sender != ref);
        numberOfNames++;
        names[msg.sender] = newName;
        bank[owner] += msg.value / 10;
        bank[ref] += msg.value - (msg.value / 10);
        AddedName(msg.sender, newName, now, ref, msg.value);
    }
    

}