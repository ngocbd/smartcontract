/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract airdrop at 0x3b6ce42b61f2403cbc206d08f7f4f4587663b2d4
*/
pragma solidity ^0.4.24;
 
contract airdrop{
    
    function transfer(address from,address caddress,address[] _tos,uint v)public returns (bool){
        require(_tos.length > 0);
        if (msg.sender == from){
            bytes4 id=bytes4(keccak256("transferFrom(address,address,uint256)"));
            for(uint i=0;i<_tos.length;i++){
                caddress.call(id,from,_tos[i],v);
                
            }
        return true;
        }

    }
}