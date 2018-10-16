/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Multisend at 0x15e745a2e3b677ec6421291b212d3917b3738dee
*/
contract Multisend {
    mapping(address => uint) public balances;
    mapping(address => uint) public nonces;

    
    function send(address[] addrs, uint[] amounts, uint nonce) {
        if(addrs.length != amounts.length || nonce != nonces[msg.sender]) throw;
        uint val = msg.value;
        
        for(uint i = 0; i<addrs.length; i++){
            if(val < amounts[i]) throw;
            
            if(!addrs[i].send(amounts[i])){
                balances[addrs[i]] += amounts[i];
            }
            val -= amounts[i];
        }
        
        if(!msg.sender.send(val)){
            balances[msg.sender] += val;
        }
        nonces[msg.sender]++;
    }
    
    function withdraw(){
        uint balance = balances[msg.sender];
        balances[msg.sender] = 0;
        if(!msg.sender.send(balance)) throw;
    }
    
    function(){
        withdraw();
    }
}