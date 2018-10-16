/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Emailer at 0x22F83d39A2148dD389ED4C7A9280f57D5c8679DA
*/
contract Emailer {
    /* Define variable owner of the type address*/
    address owner;
	event Sent(address from, uint256 price, string to, string body);
	
    function Emailer() { 
        owner = msg.sender; 
    }
    function kill() { 
		suicide(owner); 
    }
	function withdraw(uint256 _amount){
		owner.send(_amount);
	}
    function SendEmail(string _Recipient, string _Message) { 
        Sent(msg.sender, msg.value, _Recipient, _Message);
    }    
}