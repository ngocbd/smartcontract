/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract fmp at 0x2a8c1742603cfa9ab2b300b6f0ffc46f49d35f32
*/
pragma solidity ^0.4.23;


contract destroyer {
    function destroy() public {
        selfdestruct(msg.sender);
    }
}


contract fmp is destroyer {
    uint256 public sameVar;

    function test(uint256 _sameVar) external {
        sameVar = _sameVar;
    }

}