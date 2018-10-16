/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LhsTechnologyBlockchain at 0xa911F9e8D8fD08dD4E946643f7a75cA4D148b3D6
*/
pragma solidity ^0.4.0;
contract LhsTechnologyBlockchain {
    string constant message = "Welcome to the Library Of The Human Soul";

    function getMessage() public pure returns (string ret) {
        ret = message;
        return ret;
    }
}