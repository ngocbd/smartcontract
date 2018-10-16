/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DropFunnel at 0x161a4367065c0e9fc3d91c6ae65dd969bcb52638
*/
pragma solidity 0.4.24;

contract ERC20Interface {
    function transfer(address _to, uint _value) public returns (bool) {}
}

contract DropFunnel {
    
    ERC20Interface token = ERC20Interface(0xd7E7a876058D8e67efb26aD7B10a4007d90396bC);
    address owner = 0x53F64794758406C6e8355d22ee4d32926e75dCC6;
    uint dropAmount = 500000000000000000000;
  
	event PaymentFailure(
		address payee
	);

	function dropVotes(address[] receivers) public {
	    require(msg.sender == owner);
	    for (uint i = 0; i < receivers.length; i++){
	        if (!token.transfer(receivers[i],dropAmount)) {
	            emit PaymentFailure(receivers[i]);
	        }
	    }
	}
}