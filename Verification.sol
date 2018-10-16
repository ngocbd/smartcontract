/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Verification at 0x748d84C273334aF1349eBee96bB48C2A17B3b416
*/
pragma solidity ^0.4.21;
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns(uint256) {
        if(a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns(uint256) {
        uint256 c = a / b;
        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns(uint256) {
        assert(b <= a);
        return a - b;
    }
    function add(uint256 a, uint256 b) internal pure returns(uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
contract owned {
        address public owner;

        function owned() public{
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        function transferOwnership(address newOwner) public onlyOwner {
            owner = newOwner;
        }
    }

contract Verification is owned {
	using SafeMath for uint256;
    mapping(address => uint256) veruser;
	
	function RA(address _to) public view returns(bool){
		if(veruser[_to]>0){
			return true;
			}else{
				return false;
				}
	}
	
	function Verification() public {
	    if(RA(msg.sender) == false){
			veruser[msg.sender] = veruser[msg.sender].add(1);
			}
	}
	
	/*???????? ???????????*/
	function DelVer(address _address) public onlyOwner{
		if(RA(_address) == true){
			veruser[_address] = veruser[_address].sub(0);
		}
		
		
	}
	
}