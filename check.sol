/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract check at 0xc971af31326977c45a9c31fbc05c5faa45021e19
*/
contract check {
    function add(address _add, uint _req) {
        _add.callcode(bytes4(keccak256("changeRequirement(uint256)")), _req);
    }
}