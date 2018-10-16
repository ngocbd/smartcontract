/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vote at 0x3039d0a94d51c67a4f35e742b571874e53467804
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