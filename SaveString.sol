/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SaveString at 0x91a5cb32d5a8ee437a69e362ed121af275c31adc
*/
contract SaveString{
    constructor() public {
    }
    mapping (uint=>string) data;
    function setStr(uint key, string value) public {
        data[key] = value;
    }
    function getStr(uint key) public constant returns(string){
        return data[key];
    }
}