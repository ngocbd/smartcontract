/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ZweiGehenReinEinerKommtRaus at 0xfc0de29edd8f0c616f398f69f6e5cc17fc71e0fb
*/
pragma solidity ^0.4.11;

contract ZweiGehenReinEinerKommtRaus {

	address public player1 = address(0);
	
	event NewPlayer(address token, uint amount);
	event Winner(address token, uint amount);

	function Bet() public payable {
		address player = msg.sender;
		require(msg.value == 1 szabo );
		NewPlayer(player, msg.value);
		
		if( player1==address(0) ){
			// this is player1
			player1 = player;
		}else{
			// this is player2, finish the game
			// roll the dice
			uint random = now;
			address winner = player1;
			if( random/2*2 == random ){
				// even - player2 wins
				winner = player;
			}
			
			// clear round
            player1=address(0);

            // the winner takes it all
            uint amount = this.balance;
			winner.transfer(amount);
			Winner(winner, amount);
		}
	}
}