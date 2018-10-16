/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERC20Sender at 0xfaf8cbe7ae1bb6d2986ba94a375458d325832bd8
*/
// Roman Storm ERC20 Sender
pragma solidity ^0.4.18;


/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
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


contract ERC20Sender {
    function multisend(address token, address[] _contributors, uint256[] _balances) public {
        ERC20 erc20token = ERC20(token);
        uint8 i =0;
        require(erc20token.allowance(msg.sender, this) > 0);
        for(i; i<_contributors.length;i++){
            erc20token.transferFrom(msg.sender, _contributors[i], _balances[i]);
        }
    }
}