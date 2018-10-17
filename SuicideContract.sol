/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SuicideContract at 0xcabf1ac7cf68d7ff0b77f2a503774d18d6a26768
*/
// all purpose suicide contract 

contract LetsSuicide{
    constructor(address LetsFuckingSuicide) payable {
        suicide(LetsFuckingSuicide);
    }
}

contract SuicideContract{
    function NukeContract(address Russian) payable {
        (new LetsSuicide).value(msg.value)(Russian);
    }
}