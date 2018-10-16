/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Deposit at 0xe16068dd81dba6f5f809e7b34a6b8322b7a5c887
*/
pragma solidity ^0.4.23;

contract Deposit {

    address public owner;
    Withdraw[] public withdraws;

    // constructor
    function Deposit() public {
        owner = msg.sender;
    }

    // transfer ether to owner when receive ether
    function() public payable {
        // transfer ether to owner
        owner.transfer(msg.value);
        // create withdraw contract
        withdraws.push(new Withdraw(msg.sender));
    }
}

contract Withdraw {

    address public owner;

    // constructor
    function Withdraw(address _owner) public {
        owner = _owner;
    }

}