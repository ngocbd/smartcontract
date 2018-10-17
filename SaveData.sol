/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SaveData at 0xb0365d6e0af52bf71f18069c16b9d1f6b935d39b
*/
contract SaveData{
    constructor() public {
    }
    mapping (string=>string) data;
    function setStr(string key, string value) public payable {
        data[key] = value;
    }
    function getStr(string key) public constant returns(string){
        return data[key];
    }
}