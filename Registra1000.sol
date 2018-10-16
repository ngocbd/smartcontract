/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Registra1000 at 0xBbBe7e8215Da04D4165A670d0d9b8e0473944a80
*/
pragma solidity ^0.4.18;

contract Registra1000 {

   struct Arquivo {
       bytes shacode;
   }

   bytes[] arquivos;
   
   function Registra() public {
       arquivos.length = 1;
   }

   function setArquivo(bytes shacode) public {
       arquivos.push(shacode);
   }
   
 
}