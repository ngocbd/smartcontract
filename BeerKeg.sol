/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BeerKeg at 0x629469c8db3a4d7bcc3a823effcf8900119ba7e7
*/
contract BeerKeg {
    bytes20 prev; // Nickname of the previous tap attempt

    function tap(bytes20 nickname) {
        prev = nickname;
        if (prev != nickname) {
          msg.sender.send(this.balance);
        }
    }
}