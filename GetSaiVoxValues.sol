/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GetSaiVoxValues at 0x57eb0fe9be26e62673033ae0bb38c23647a68867
*/
pragma solidity ^0.4.24;

contract SaiVox {
    function par() public returns (uint);
    function way() public returns (uint);
}

contract GetSaiVoxValues {
    SaiVox public saiVox = SaiVox(0x9B0F70Df76165442ca6092939132bBAEA77f2d7A);

    uint public par;
    uint public way;

    function update() public {
        par = saiVox.par();
        way = saiVox.way();
    }
}