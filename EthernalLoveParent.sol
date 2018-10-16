/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthernalLoveParent at 0x3559ffe4ad79d4627b1e404706574aa44705d26b
*/
contract DigitalPadlock {
    string public message;

    function DigitalPadlock(string _m) public {
        message = _m;
    }
}

contract EthernalLoveParent {
  address owner;
  address[] public padlocks;
  event LogCreatedValentine(address padlock); // maybe listen for events

  function EthernalLoveParent() public {
    owner = msg.sender;
  }

  function createPadlock(string _m) public {
    DigitalPadlock d = new DigitalPadlock(_m);
    LogCreatedValentine(d); // emit an event
    padlocks.push(d); 
  }
}