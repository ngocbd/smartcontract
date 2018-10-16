/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PayToSHA256 at 0xD35e6F3B26F8992a7F023Ad878e13A82ddEd2232
*/
pragma solidity 0.4.4;

contract PayToSHA256 {
    mapping(bytes32 => uint256) balances;

    function lock (bytes32 hash) payable {
        balances[hash] += msg.value;
    }

    function release (string password) {
        bytes32 hash = sha256(password);
        uint256 amount = balances[hash];
        if (amount == 0)
            throw;

        balances[hash] = 0;
        if (!msg.sender.send(amount))
            throw;
    }
}