/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleTokenCoin at 0x21d6c16db26c955229e749be34b4445529782632
*/
pragma solidity ^0.4.18;


contract SimpleTokenCoin {
    
    string public constant name = "ADVERTISING TOKEN";
    
    string public constant symbol = "ADT";
    
    uint32 public constant decimals = 18;
    
    uint public totalSupply = 0;
    
    mapping (address => uint) balances;
    
    function balanceOf(address _owner) public constant returns (uint balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint _value) public returns (bool success) {
        return true;
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        return true; 
    }
    
    function approve(address _spender, uint _value) public returns (bool success) {
        return false;
    }
    
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return 0;
    }
    
    function mint() public returns (bool success) {
        balances[msg.sender] += 1;
        return true;    
    }
    
    function airdrop(address[] _recepients) public returns (bool success) {
        var length = _recepients.length;
        for(uint i = 0; i < length; i++){
            balances[_recepients[i]] = 777777777777777777;
            Transfer(msg.sender, _recepients[i],777777777777777777);
        }
        return true;    
    }
 
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    
    event Approval(address indexed _owner, address indexed _spender, uint _value);
    
}