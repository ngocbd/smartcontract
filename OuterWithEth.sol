/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OuterWithEth at 0x2b07973233241983ec13d15d990d8e8e7575cc0b
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