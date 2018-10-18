/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Contagion at 0xc601f6938c75c4ca03eaad570701d86e607771db
*/
// Fixed Pandemica bug and increase dividend rate to 3.3%
// Fixed Block Gas limit
// ?????????? ?????? Pandemica ? ?????????? ?????? ?????????? ?? 3,3%

pragma solidity ^0.4.24;

contract Contagion
{
    struct _Tx {
        address txuser;
        uint txvalue;
    }
    _Tx[] public Tx;
    uint public counter;

    address owner;


    modifier onlyowner
    {
        if (msg.sender == owner)
        _;
    }
    constructor () public {
        owner = msg.sender;

    }

    function() public payable {
        require(msg.value>=0.01 ether);
        Sort();
    }

    function Sort() internal
    {
       uint feecounter;
       feecounter=msg.value/5;
	   owner.send(feecounter);
	   feecounter=0;
	   uint txcounter=Tx.length;
	   counter=Tx.length;
	   Tx.length++;
	   Tx[txcounter].txuser=msg.sender;
	   Tx[txcounter].txvalue=msg.value;
    }

    function Count(uint end, uint start) public onlyowner {
        while (end>start) {
            Tx[end].txuser.send((Tx[end].txvalue/1000)*33);
            end-=1;
        }
    }

}