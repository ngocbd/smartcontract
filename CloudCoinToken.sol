/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CloudCoinToken at 0x62BC2aec45b6ab216C198C105C78093284B2327E
*/
pragma solidity ^0.4.13;
    
contract CloudCoinToken {
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    string public name;
    string public symbol;
    uint8 public decimals;
        
    event Transfer (address indexed from, address indexed to, uint256 value);          
                  
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function CloudCoinToken (uint256 _supply, string _name, string _symbol, uint8 _decimal) {
        balanceOf[msg.sender] = _supply;              // Give the creator all initial tokens
        name = _name;                                   // Set the name for display purposes
        symbol = _symbol;                               // Set the symbol for display purposes
        decimals = _decimal;                            // Amount of decimals for display purposes
    }
    
    /* Send coins */
    function transfer(address _to, uint256 _value) {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
            
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
            
        /* Notify anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
    }
}