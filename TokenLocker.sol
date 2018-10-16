/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TokenLocker at 0xc7d08d6b91385ae576de090fd2e39b28a46d9e94
*/
pragma solidity ^0.4.13;

contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TokenLocker {
    
    address public owner;

    ERC20 public token;

    /**
     * @dev Create a new TokenLocker contract
     * @param tokenAddr ERC20 token this contract will be used to lock
     */
    function TokenLocker (ERC20 tokenAddr) public {
        owner = msg.sender;
        token = tokenAddr;
    }

    /** 
     *  @dev Call the ERC20 `transfer` function on the underlying token contract
     *  @param dest Token destination
     *  @param amount Amount of tokens to be transferred
     */
    function transfer(address dest, uint amount) public returns (bool) {
        require(msg.sender == owner);
        return token.transfer(dest, amount);
    }

}