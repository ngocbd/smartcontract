/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RouletteGame at 0x062e659a3c8991bc1739e72c68edb9ac7b5a8ca7
*/
pragma solidity ^0.4.20;

contract RouletteGame
{

    uint8 public result = 0;

    bool public finished = false;

    address public rouletteOwner;

    function Play(uint8 _bet)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(result == _bet && msg.value>0.001 ether && !finished)
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

    function StopGame()
    public
    payable
    {
        require(msg.sender == rouletteOwner);
        GiftHasBeenSent();
        if (msg.value>0.001 ether){
            msg.sender.transfer(this.balance);
        }
    }

    function GiftHasBeenSent()
    private
    {
        finished = true;
    }

    function() public payable{}
}