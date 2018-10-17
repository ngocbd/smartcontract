/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Airdropper at 0xe02d4ab8204b496953ca4db9c07c50b27bcf6aae
*/
pragma solidity ^0.4.18;
 
contract Ownable {
  address public owner;
 
  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}

interface Token {
  function balanceOf(address _owner) public constant returns (uint256 );
  function transfer(address _to, uint256 _value) public ;
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
}

contract Airdropper is Ownable {
    
    function AirTransfer(address[] _recipients, uint _values, address _tokenAddress) onlyOwner public returns (bool) {
        require(_recipients.length > 0);

        Token token = Token(_tokenAddress);
        
        for(uint j = 0; j < _recipients.length; j++){
            token.transfer(_recipients[j], _values);
        }
 
        return true;
    }
 
     function withdrawalToken(address _tokenAddress) onlyOwner public { 
        Token token = Token(_tokenAddress);
        token.transfer(owner, token.balanceOf(this));
    }

}