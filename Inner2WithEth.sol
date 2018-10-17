/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Inner2WithEth at 0xe98f389ef3db54fc1bc7cddebdfdf2ec7c366d88
*/
pragma solidity ^0.4.24;

contract OuterWithEth {
    Inner1WithEth public myInner1 = new Inner1WithEth();
    
    function callSomeFunctionViaOuter() public payable {
        myInner1.callSomeFunctionViaInner1.value(msg.value)();
    }
}

contract Inner1WithEth {
    Inner2WithEth public myInner2 = new Inner2WithEth();
    
    function callSomeFunctionViaInner1() public payable{
        myInner2.doSomething.value(msg.value)();
    }
}

contract Inner2WithEth {
    uint256 someValue;
    event SetValue(uint256 val);
    
    function doSomething() public payable {
        someValue = block.timestamp;
        emit SetValue(someValue);
    }
    
    function getAllMoneyOut() public {
        msg.sender.transfer(this.balance);
    }
}