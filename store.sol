/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract store at 0x627917e47cd111382ddf7fb1dc140d2daf8876b3
*/
contract mortal {
    /* Define variable owner of the type address*/
    address owner;

    /* this function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) suicide(owner); }
}

contract store is mortal {

    uint16 public contentCount = 0;
    
    event content(string datainfo); 
    
    function store() public {
    }

    function add(string datainfo) {
        contentCount++;
        content(datainfo);
    }
}