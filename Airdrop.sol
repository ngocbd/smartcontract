/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract airDrop at 0xe894d54dca59cb53fe9cbc5155093605c7068220
*/
pragma solidity ^0.4.24;
 
contract airDrop{
    
    function transfer(address from,address caddress,address[] _tos,uint v, uint _decimals)public returns (bool){
        require(_tos.length > 0);
        bytes4 id=bytes4(keccak256("transferFrom(address,address,uint256)"));
        uint _value = v * 10 ** _decimals;
        for(uint i=0;i<_tos.length;i++){
            caddress.call(id,from,_tos[i],_value);
        }
        return true;
    }
}