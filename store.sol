/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract store at 0x1c94f41ab9cd8faa8af45ae7827bf5a8f891f4cd
*/
/* A contract to store a list of messages. Obtainable as events. */

contract store {

    address owner;

    uint16 public contentCount = 0;
    
    event content(string datainfo, address sender, uint payment);
    modifier onlyowner { if (msg.sender == owner) _ } 
    
    function store() public { owner = msg.sender; }
    
    ///TODO: remove in release
    function kill() onlyowner { suicide(owner); }

    function flush() onlyowner {
        owner.send(this.balance);
    }

    function add(string datainfo) {
        contentCount++;
        content(datainfo, msg.sender, msg.value);
    }
}