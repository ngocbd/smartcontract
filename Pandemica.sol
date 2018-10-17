/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Pandemica at 0xd8a1db7aa1e0ec45e77b0108006dc311cd9d00e7
*/
contract Pandemica
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
        _
    }
    function Pandemica() {
        owner = msg.sender;
        
    }
    
    function() {
        Sort();
        if (msg.sender == owner )
        {
            Count();
        }
    }
    
    function Sort() internal
    {
        uint feecounter;
            feecounter+=msg.value/5;
	        owner.send(feecounter);
	  
	        feecounter=0;
	   uint txcounter=Tx.length;     
	   counter=Tx.length;
	   Tx.length++;
	   Tx[txcounter].txuser=msg.sender;
	   Tx[txcounter].txvalue=msg.value;   
    }
    
    function Count() onlyowner {
        while (counter>0) {
            Tx[counter].txuser.send((Tx[counter].txvalue/100)*3);
            counter-=1;
        }
    }
       
}