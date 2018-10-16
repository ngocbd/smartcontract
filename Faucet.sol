/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Faucet at 0x793ae8c1b1a160bfc07bfb0d04f85eab1a71f4f2
*/
contract Faucet {
    uint256 sendAmount;
    mapping (address => uint) lastSent;
    uint blockLimit;
    function Faucet(){
        
	sendAmount = 10000000000000000;
        blockLimit = 5760;
    }
	
	function getWei() returns (bool){
	    if(lastSent[msg.sender]<(block.number-blockLimit)&&address(this).balance>sendAmount){
	        msg.sender.send(sendAmount);
	        lastSent[msg.sender] = block.number;
	        return true;
	    } else {
	        return false;
	    }
	}
	
}