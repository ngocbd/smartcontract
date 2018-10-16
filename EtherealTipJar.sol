/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherealTipJar at 0x678042580304a7f32dd03b027d90083818dc16a1
*/
pragma solidity ^0.4.18;
contract EtherealFoundationOwned {
	address private Owner;
    
	function IsOwner(address addr) view public returns(bool)
	{
	    return Owner == addr;
	}
	
	function TransferOwner(address newOwner) public onlyOwner
	{
	    Owner = newOwner;
	}
	
	function EtherealFoundationOwned() public
	{
	    Owner = msg.sender;
	}
	
	function Terminate() public onlyOwner
	{
	    selfdestruct(Owner);
	}
	
	modifier onlyOwner(){
        require(msg.sender == Owner);
        _;
    }
}

contract EtherealTipJar  is EtherealFoundationOwned{
    string public constant CONTRACT_NAME = "EtherealTipJar";
    string public constant CONTRACT_VERSION = "A";
    string public constant QUOTE = "'The universe never did make sense; I suspect it was built on government contract.' -Robert A. Heinlein";
    
    
    event RecievedTip(address indexed from, uint256 value);
	function () payable public {
		RecievedTip(msg.sender, msg.value);		
	}
	
	event TransferedEth(address indexed to, uint256 value);
	function TransferEth(address to, uint256 value) public onlyOwner{
	    require(this.balance >= value);
	    
        if(value > 0)
		{
			to.transfer(value);
			TransferedEth(to, value);
		}   
	}
}