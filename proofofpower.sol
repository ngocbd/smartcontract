/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract proofofpower at 0xb2c1b890f35dc712ecc909989486dc24746f06c7
*/
contract proofofpower {
    
    bytes[6] public whitepaper;
    uint counter;
    function uploadData(bytes _data) public returns (uint){
        whitepaper[counter] = _data;
        counter++;
    }
}