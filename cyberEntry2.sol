/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract cyberEntry2 at 0x4ea13653dcd77337513fd60866d8d3e2086d2343
*/
pragma solidity ^0.4.19;

contract Gatekeeper {
    function enter(bytes32 _passcode, bytes8 _gateKey) public returns (bool);
}

contract cyberEntry2 {
    address public gkAddress;

    Gatekeeper gk; 

    function cyberEntry2(address _gkAddress, bytes32 passphrase) public {
        address me;
        assembly { me := address }

        bytes8 key = bytes8(uint64(keccak256(passphrase, me)) ^ uint64(0) - 1 );
        gkAddress = _gkAddress;
        gk = Gatekeeper(gkAddress);
        gk.enter( passphrase, key);
    }

}