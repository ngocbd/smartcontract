/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vote at 0x587d6669a2743a1d6094f150006f56f85b5aade3
*/
contract Vote {
    address creator;

    function Vote() {
        creator = msg.sender;
    }

    function() {
        if (msg.value > 0) {
            tx.origin.send(msg.value);
        }
    }

    function kill() {
        if (msg.sender == creator) {
            suicide(creator);
        }
    }
}