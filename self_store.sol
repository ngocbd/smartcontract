/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract self_store at 0x0318179601a70085aeb488f178b081295b65ecc9
*/
contract self_store {

    address owner;

    uint public contentCount = 0;
    
    event content(string datainfo, uint indexed version);
    modifier onlyowner { if (msg.sender == owner) _ }
    
    function self_store() public { owner = msg.sender; }
    
    ///TODO: remove in release
    function kill() onlyowner { suicide(owner); }

    function flush() onlyowner {
        owner.send(this.balance);
    }

    function add(string datainfo, uint version) onlyowner {
        contentCount++;
        content(datainfo, version);
    }
}