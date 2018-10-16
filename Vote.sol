/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vote at 0x71caff5fd6facbaf1863426ac05b3703636a9bb9
*/
contract Vote {
    event LogVote(address indexed addr);

    function() {
        LogVote(msg.sender);

        if (msg.value > 0) {
            if (!msg.sender.send(msg.value)) {
                throw;
            }
        }
    }
}