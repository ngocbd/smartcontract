/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract echo at 0x6896ad514a2ce7586762f8e641c7821827a255c1
*/
contract echo {
  /* Constructor */
  function () {
    msg.sender.send(msg.value);
  }
}