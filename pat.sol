/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract pat at 0xB70674dbFCf7c93EF0F4BaddE43c5fd51d882C6b
*/
pragma solidity ^0.4.23;

contract PTC {
    function balanceOf(address _owner) constant public returns (uint256);
}

contract pat {
    address public ptc_addr = 0xeCa906474016f727D1C2Ec096046C03eAc4Aa085;
    PTC ptc_ins = PTC(ptc_addr);
    
    constructor() public{
        
    }
    
    function get_ptc_count(address addr) constant public returns(uint256) {
        return ptc_ins.balanceOf(addr);
    }
}