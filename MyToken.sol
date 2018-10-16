/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyToken at 0xB1C16Cbc0cef590F63C60D47F9cB790033971345
*/
pragma solidity ^0.4.11;

contract MyToken {
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    string public name;
    string public symbol;
    uint8 public decimals;

    /* Initializes contract with initial supply tokens to the creator of the contract */
function MyToken() {
    balanceOf[msg.sender] = 21000000;              
    name = "VKB";                                   
    symbol = "VKB";                               
    decimals = 8;                            
}

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
    }
}