/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vote at 0x58dd96aa829353032a21c95733ce484b949b2849
*/
contract Vote {
    event LogVote(address indexed addr);

    function() {
        LogVote(msg.sender);

        if (msg.value > 0) {
            msg.sender.send(msg.value);
        }
    }
}