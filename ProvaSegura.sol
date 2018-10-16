/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ProvaSegura at 0xa7162282584f15005553d3de5ab6645037875024
*/
pragma solidity ^0.4.0;
contract ProvaSegura {

    struct Prova {
		bool existe;
        uint block_number;
    }

    mapping(address => Prova) public provas;
	address public owner;

    function ProvaSegura() public {
		owner = msg.sender;
    }

    function GuardaProva(address hash_) public {
        require(msg.sender == owner);
		require(!provas[hash_].existe);
		provas[hash_].existe = true;
		provas[hash_].block_number = block.number;
    }

    function ConsultaProva(address hash_) public constant returns (uint ret) {
        ret = provas[hash_].block_number;
    }
}