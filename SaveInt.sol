/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SaveInt at 0x8e0d27a63c06713aaea40a57b962de41f0317a1e
*/
contract SaveInt{
    constructor() public {
    }
    mapping (string=>uint) data;
    function setStr(string key, uint value) public {
        data[key] = value;
    }
    function getStr(string key) public constant returns(uint){
        return data[key];
    }
}