/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERC777AcceptAny at 0xe32df3d6c16149df6e95b105d45e313fd26e8f51
*/
pragma solidity 0.4.24;

contract ERC777AcceptAny {

    bytes32 constant ERC820_ACCEPT_MAGIC = keccak256("ERC820_ACCEPT_MAGIC");
    bytes32 constant ERC777TokensRecipientHash = keccak256("ERC777TokensRecipient");


    function tokensReceived(
        address operator,  // solhint-disable no-unused-vars
        address from,
        address to,
        uint amount,
        bytes userData,
        bytes operatorData
    )
        public
    {

    }

    function canImplementInterfaceForAddress(
        address addr,
        bytes32 interfaceHash
    ) view public returns(bytes32) {
        require (interfaceHash == ERC777TokensRecipientHash);
        return ERC820_ACCEPT_MAGIC;
    }

}