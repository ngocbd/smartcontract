/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract br at 0x69aceefdaaaa2895b4b2f9a4589ae527687e193c
*/
pragma solidity ^0.4.24;
contract ERC20 {
    function transfer(address receiver, uint256 amount) external;
}
contract br{
    function sendToken(address contractadr, address _to, uint256 _value) public {
        ERC20 token = ERC20(contractadr);
        token.transfer(_to, _value);
    }
}