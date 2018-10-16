/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RegistroBlockchain at 0x4741f3a19196740af562cdd4274dcaf273e45480
*/
pragma solidity ^0.4.21;
contract RegistroBlockchain {

    struct Registro {
        bool existe;
        uint block_number;
    }

    mapping(bytes32 => Registro) public registros;
    address public admin;

    constructor() public {
        admin = msg.sender;
    }
    
    function TrocarAdmin(address _admin) public {
        require(msg.sender == admin);
        admin = _admin;
    }

    function GuardaRegistro(bytes32 hash) public {
        require(msg.sender == admin);
        if (!registros[hash].existe) {
            registros[hash].existe = true;
            registros[hash].block_number = block.number;
        }
    }

    function ConsultaRegistro(bytes32 hash) public constant returns (uint) {
        require(registros[hash].existe);
        return (registros[hash].block_number);
    }
}