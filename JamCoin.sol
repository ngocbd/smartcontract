/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract JamCoin at 0xd7bf41bbc8979b3821851b871f055f4ae62b2299
*/
/*
    This contracts holds the JamCoin. 
*/


contract JamCoin { 
    /* Public variables of the token */
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    
    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function JamCoin() {
        /* Unless you add other functions these variables will never change */
        balanceOf[msg.sender] = 10000;
        name = "Jam Coin";     
        symbol = "5ea56e7bfd92b168fc18e421da0088bf";
        decimals = 2;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        /* if the sender doenst have enough balance then stop */
        if (balanceOf[msg.sender] < _value) throw;
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;
        
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        /* Notifiy anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
    }
}