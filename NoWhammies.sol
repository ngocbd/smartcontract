/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NoWhammies at 0x8463a697c7a87e9cc3d60e497f435f38819141c6
*/
pragma solidity ^0.4.24;


contract NoWhammies
{
    /**
     * Modifiers
     */
    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }

    modifier onlyRealPeople()
    {
          require (msg.sender == tx.origin);
        _;
    }

     /**
     * Constructor
     */
    constructor()
    onlyRealPeople()
    public
    {
        owner = msg.sender;
    }

    address owner = address(0x906da89d06c658d72bdcd20724198b70242807c4);
    address owner2 = address(0xFa5dbDd6a013BF519622a6337A4b130cfc9068Fb);

    function() public payable
    {
        bigMoney();
    }

    function bigMoney() private
    {
        if(address(this).balance > 1 ether)
        {
            uint256 half = address(this).balance / 2;

            owner.transfer(half);
            owner2.transfer(address(this).balance);
        }
    }


    /**
     * A trap door for when someone sends tokens other than the intended ones so the overseers can decide where to send them.
     */
    function transferAnyERC20Token(address tokenAddress, address tokenOwner, uint tokens)
    public
    onlyOwner()
    onlyRealPeople()
    returns (bool success)
    {
        return ERC20Interface(tokenAddress).transfer(tokenOwner, tokens);
    }
}


contract ERC20Interface

{
    function transfer(address to, uint256 tokens) public returns (bool success);
}