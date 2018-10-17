/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorageCleide at 0xf491fb89ec484d9569c68e91e14d3939b1044de7
*/
//Tell the Solidity compiler what version to use
pragma solidity ^0.4.8;

//Declares a new contract
contract SimpleStorageCleide {
    //Storage. Persists in between transactions
    uint price;

    //Allows the unsigned integer stored to be changed
    function setCleide (uint newValue) 
    public
    {
        price = newValue;
    }
    
    //Returns the currently stored unsigned integer
    function getCleide() 
    public 
    view
    returns (uint) 
    {
        return price;
    }
}