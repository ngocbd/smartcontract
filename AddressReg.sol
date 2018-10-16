/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AddressReg at 0xbad661c5a1970342ade69857689738b6c8d9da51
*/
contract AddressReg{

    address public owner;

    function setOwner(address _owner){
        if(msg.sender==owner)
            owner = _owner;
    }

    function AddressReg(){
        owner = msg.sender;
    }

    mapping (address=>bool) isVerifiedMap;

    function verify(address addr){
        if(msg.sender==owner)
            isVerifiedMap[addr] = true;
    }

    function deverify(address addr){
        if(msg.sender==owner)
            isVerifiedMap[addr] = false;
    }

    function hasPhysicalAddress(address addr) constant returns(bool){
        return isVerifiedMap[addr];
    }

}