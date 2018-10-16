/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract comm_channel at 0x9c9dc2b707a99ae4b6795538ac6bf4f6d4842830
*/
/* A contract to exchange encrypted messages. Most of the work done on
   the client side. */

contract comm_channel {
	
    address owner;
    
    event content(string datainfo, string senderKey, string recipientKey, uint amount);
    modifier onlyowner { if (msg.sender == owner) _ }
    
    function comm_channel() public { owner = msg.sender; }
    
    ///TODO: remove in release
    function kill() onlyowner { suicide(owner); }

    function flush() onlyowner {
        owner.send(this.balance);
    }

    function add(string datainfo, string senderKey, string recipientKey,
                 address resendTo) {
        
        //try to resend money from message to the address
        if(msg.value > 0) {
            if(resendTo == 0) throw;
            if(!resendTo.send(msg.value)) throw;
        }
        
        //write to blockchain
        content(datainfo, senderKey, recipientKey, msg.value);
    }
}