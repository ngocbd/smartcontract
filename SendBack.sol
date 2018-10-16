/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SendBack at 0xc6b13d41866cba306fe9ddfafd580ac8d92bfb75
*/
pragma solidity 0.4.4; // optimization enabled

contract SendBack {
    function() payable {
        if (!msg.sender.send(msg.value))
            throw;
    }
}