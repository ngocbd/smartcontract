/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthAvatar at 0x4fbf2f1613cc86314b22ae10ae95d19cf2990824
*/
pragma solidity ^0.4.19;

contract EthAvatar {
    mapping (address => string) private ipfsHashes;

    event DidSetIPFSHash(address indexed hashAddress, string hash);


    function setIPFSHash(string hash) public {
        ipfsHashes[msg.sender] = hash;

        DidSetIPFSHash(msg.sender, hash);
    }

    function getIPFSHash() public view returns (string) {
        return ipfsHashes[msg.sender];
    }
}