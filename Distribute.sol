/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Distribute at 0x360d15eed32c9bdf393497fc28189f27f3c17f1a
*/
/**

 * @title Ownable

 * @dev The Ownable contract has an owner address, and provides basic authorization control

 * functions, this simplifies the implementation of "user permissions".

 */

contract Ownable {

  address public owner;





  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);





  /**

   * @dev The Ownable constructor sets the original `owner` of the contract to the sender

   * account.

   */

  function Ownable() {

    owner = msg.sender;

  }





  /**

   * @dev Throws if called by any account other than the owner.

   */

  modifier onlyOwner() {

    require(msg.sender == owner);

    _;

  }





  /**

   * @dev Allows the current owner to transfer control of the contract to a newOwner.

   * @param newOwner The address to transfer ownership to.

   */

  function transferOwnership(address newOwner) onlyOwner public {

    require(newOwner != address(0));

    OwnershipTransferred(owner, newOwner);

    owner = newOwner;

  }

}



contract token { function transfer(address receiver, uint amount){  } }



contract Distribute is Ownable{

	

	token tokenReward = token(0xdd007278B667F6bef52fD0a4c23604aA1f96039a);



	function register(address[] _addrs) onlyOwner{

		for(uint i = 0; i < _addrs.length; ++i){

			tokenReward.transfer(_addrs[i],5*10**8);

		}

	}



	function withdraw(uint _amount) onlyOwner {

		tokenReward.transfer(owner,_amount);

	}

}