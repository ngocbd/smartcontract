/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Splitter at 0x8085206b30577d913317df6c30dd3ee0cf851e22
*/
pragma solidity ^0.4.25;

contract Splitter {
    address[] public addrs;
    uint256[] public shares;
    uint256 public denom;

    constructor(address[] _addrs, uint256[] _shares, uint256 _denom) public {
        addrs = _addrs;
        shares = _shares;
        denom = _denom;
    }
    
    function () payable public {
        uint256 val = msg.value;
        for (uint i = 0; i < addrs.length; i++) {
            addrs[i].transfer(val * shares[i] / denom);
        }
    }
}