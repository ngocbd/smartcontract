/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Crowdsale at 0x780bcf792a16ef5ce9d24734d502dc08336826ad
*/
pragma solidity 0.4.23;

contract Crowdsale{
    
    
    address public owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function changeOwner(address _newOwner) public onlyOwner{
        require(_newOwner != address(0x0));
        owner = _newOwner;
    }
    
    constructor() public {
        owner = 0x9e5cf4e9D931bE31E01f9e94Ec2ABEbF613C3019;
    }
    
    event Tranferred(address beneficiary, uint tokenAmount, uint bonusAmont);
    
    function transfer(address _beneficiary, uint _tokenAmount, uint _bonusAmont) public onlyOwner{
        emit Tranferred(_beneficiary, _tokenAmount, _bonusAmont);
    }
}