/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WhiteList at 0x924b52b297dac65cd64d394adc91791ff4bcb381
*/
contract WhiteList {
    
    mapping (address => bool)   public  whiteList;
    
    address  public  owner;
    
    function WhiteList() public {
        owner = msg.sender;
        whiteList[owner] = true;
    }
    
    function addToWhiteList(address [] _addresses) public {
        require(msg.sender == owner);
        
        for (uint i = 0; i < _addresses.length; i++) {
            whiteList[_addresses[i]] = true;
        }
    }
    
    function removeFromWhiteList(address [] _addresses) public {
        require (msg.sender == owner);
        for (uint i = 0; i < _addresses.length; i++) {
            whiteList[_addresses[i]] = false;
        }
    }
}