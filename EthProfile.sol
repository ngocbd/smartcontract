/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthProfile at 0x7440baed1503b5d103dda4893ea5bc59c4bf08d4
*/
pragma solidity ^0.4.0;

contract EthProfile{
    mapping(address=>string) public name;
    mapping(address=>string) public description;
    mapping(address=>string) public contact;
    mapping(address=>string) public imageAddress;

    constructor() public{
    }
    
    event Success(string status, address sender);

    function updateName(string newName) public{
        require(bytes(newName).length <256);
        name[msg.sender] = newName;
        emit Success('Name Updated',msg.sender);
    }
    
    function updateDescription(string newDescription) public{
        require(bytes(newDescription).length <256);
        description[msg.sender] = newDescription;
        emit Success('Description Updated',msg.sender);
    }
    
    function updateContact(string newContact) public{
        require(bytes(newContact).length < 256);
        contact[msg.sender] = newContact;
        emit Success('Contact Updated',msg.sender);
    }
    
    function updateImageAddress(string newImage) public{
        require(bytes(newImage).length <256);
        imageAddress[msg.sender] = newImage;
        emit Success('Image Updated',msg.sender);
    }
}