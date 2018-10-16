/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Emitter at 0x795C96c59f765F9442438DD03c5fAab2259DCD60
*/
pragma solidity >=0.4.13;

contract Emitter {
    event Emit(uint x);
    function emit(uint x) {
        Emit(x);
    }
}

contract Caller {
    address emitter;
    function setEmitter(address e) {
        if (emitter == 0x0) {
            emitter = e;
        }
    }
    function callEmitter(uint x) {
        Emitter(emitter).emit(x);
    }
}