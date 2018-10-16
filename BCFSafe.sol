/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BCFSafe at 0xc5912c5AA88D7c947C9510b3c8D76543C72Ed98c
*/
contract BCFSafe {
    /* Time Deposit and Return Funds */
    address owner;
    uint lockTime;
    function TimeDeposit() {
 owner = msg.sender;
 lockTime = now + 30 minutes;
    }
    function returnMyMoney(uint amount){
        if (msg.sender==owner && now > lockTime) {
            owner.send(amount);
        }
    }
}