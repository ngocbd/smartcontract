/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ContractOwnershipBurn at 0x9c875cd04abfa2bd0461c9baf42059913f6e7150
*/
pragma solidity ^0.4.18;


// ----------------------------------------------------------------------------

// ContractOwnershipBurn

// Burn Ownership of a Smart Contract

// Can only call the Accept Ownership method, nothing else

// ----------------------------------------------------------------------------



contract OwnableContractInterface {

    event OwnershipTransferred(address indexed _from, address indexed _to);

    function transferOwnership(address _newOwner) public ;
    function acceptOwnership() public;

}






// ----------------------------------------------------------------------------

contract ContractOwnershipBurn {



    // ------------------------------------------------------------------------

    // Constructor

    // ------------------------------------------------------------------------

    function ContractOwnershipBurn() public  {


    }




    function burnOwnership(address contractAddress ) public   {

        OwnableContractInterface(contractAddress).acceptOwnership() ;

    }

}