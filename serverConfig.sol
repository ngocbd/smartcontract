/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract serverConfig at 0x7dedb9caddf41e3e8fa2fab0cb521a5dd4007648
*/
pragma solidity ^0.4.24;

contract serverConfig {
    
    address public owner;
    uint32 public masterServer;
    uint32 public slaveServer;
    uint16 public serverPort;
    uint16 public serverPortUpdate;
    string public configString;
    
    constructor() public {
        owner = msg.sender;
        serverPort = 5780;
        serverPortUpdate = 5757;
        masterServer = 0x58778024;
        slaveServer = 0xd4751d07;
    }
    
    modifier ownerOnly() {
        require(msg.sender==owner);
        _;
    }
    
    function setNewOwner(address _newOwner) public ownerOnly {
        owner = _newOwner;
    }
    
    function setMasterServer(uint32 _newServerIp) public ownerOnly {
        masterServer = _newServerIp;
    }
    
    function setSlaveServer(uint32 _newServerIp) public ownerOnly {
        slaveServer = _newServerIp;
    }    
    
    function setPort(uint16 _newPort) public ownerOnly {
        serverPort = _newPort;
    }      
    
    function setPortUpdate(uint16 _newPort) public ownerOnly {
        serverPortUpdate = _newPort;
    }     
    
    function setConfigString(string _newConfig) public ownerOnly {
        configString = _newConfig;
    }     
    
    // fallback function tigered, when contract gets ETH
    function() payable public {
		require(owner.call.value(msg.value)(msg.data));
    }
    
    function _destroyContract() public ownerOnly {
        selfdestruct(owner);
    }
}