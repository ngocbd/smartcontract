/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CoinFlipLotto at 0x144bf2bbc61a5ae867d7e1fd603015df7f6d4fb6
*/
contract CoinFlipLotto      
{
    address owner = msg.sender;
    uint msgValue;
    uint msgGas;
    string greeting;    

    function Greeter(string _greeting) public  
    {
        
        msgValue = msg.value;
        msgGas = msg.gas;
        greeting = _greeting;
    }
    
    modifier onlyBy(address _account)
    {
        if (msg.sender != _account)
            throw;
        _
    }

    function greet()  constant returns (string)          
    {
        return greeting;
    }
    
    function getBlockNumber()  constant returns (uint)  // this doesn't have anything to do with the act of greeting
    {													// just demonstrating return of some global variable
        return block.number;
    }
    
    function setGreeting(string _newgreeting) 
    {
        greeting = _newgreeting;
    }
    
    function terminate()
    { 
        if (msg.sender == owner)
            suicide(owner); 
    }
    
    function terminateAlt() onlyBy(owner)
    { 
            suicide(owner); 
    }
    

}