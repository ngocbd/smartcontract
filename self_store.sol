/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract self_store at 0xf9e03d5e3d86277574cfd5f7e842f213cf88945f
*/
/* A contract to store only messages approved by owner */
contract self_store {

    address owner;

    uint16 public contentCount = 0;
    
    event content(string datainfo); 
    
    function self_store() public { owner = msg.sender; }
    
    ///TODO: remove in release
    function kill() { if (msg.sender == owner) suicide(owner); }

    function add(string datainfo) {
        if (msg.sender != owner) return;
        contentCount++;
        content(datainfo);
    }

    function flush() {
        owner.send(this.balance);
    }
}