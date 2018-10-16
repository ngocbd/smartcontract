/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vote at 0x36ba156f8fba7bd116f78461d9fdf265b4e75747
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