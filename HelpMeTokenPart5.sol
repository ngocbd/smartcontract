/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelpMeTokenPart5 at 0xcf9af35057ef678f046bdaf0b0e6c11ef20c992b
*/
pragma solidity ^0.4.18;


contract HelpMeTokenInterface{
    function thankYou( address _a )  public returns(bool);
    function owner()  public returns(address);
}


contract HelpMeTokenPart5 {
    
    string public name = ") SEND ANY ETH TO ANY THIS TOKENS";
    string public symbol = ") SEND ANY ETH TO ANY THIS TOKENS";
    uint256 public num = 5;
    uint256 public totalSupply = 2100005 ether;
    uint32 public constant decimals = 18;
    
    mapping(address => bool) thank_you;
    bool public stop_it = false;
    address constant helpMeTokenPart1 = 0xd1a3ace46c98e028229974217201433e7163c4dd;
    
    modifier onlyPart1() {
        require(msg.sender == helpMeTokenPart1);
        _;
    }
    
    event Transfer(address from, address to, uint tokens);
    
    function() public payable
    {
        require( msg.value > 0 );
        HelpMeTokenInterface token = HelpMeTokenInterface (helpMeTokenPart1);
        token.owner().transfer(msg.value);
        token.thankYou( msg.sender );
    }
    
    function stopIt() public onlyPart1 returns(bool)
    {
        stop_it = true;
        return true;
    }
    
    function thankYou(address _a) public onlyPart1 returns(bool)
    {
        thank_you[_a] = true;
        emit Transfer(_a, address(this), num);
        return true;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        if( stop_it ) return 0;
        else if( thank_you[_owner] == true ) return 0;
        else return num  * 1 ether;
        
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool) {
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return num;
     }

}