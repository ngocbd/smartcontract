/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract bbb at 0xa9659531a174390b6921ffd540365bbb02297f10
*/
contract bbb{
    /* Define variable owner of the type address*/
    address owner;
	event EmailSent(address Sender, uint256 PricePaid, string EmailAddress, string Message);
	
    function bbb() { 
        owner = msg.sender; 
    }
    function Kill() { 
		if(msg.sender==owner){
			suicide(owner); 
		}		
    }
	function Withdraw(uint256 AmountToWithdraw){
		owner.send(AmountToWithdraw);
	}
    function SendEmail(string EmailAddress, string Message) { 
        EmailSent(msg.sender, msg.value, EmailAddress, Message);
    }    
}