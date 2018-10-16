/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Whitelist at 0xd284b7c80ed6cf8430536646066e032a558d48bd
*/
contract Whitelist {
    address public owner;
    address public sale;

    mapping (address => uint) public accepted;

    function Whitelist() {
        owner = msg.sender;
    }

    // Amount in WEI i.e. amount = 1 means 1 WEI
    function accept(address a, uint amount) {
        assert (msg.sender == owner || msg.sender == sale);

        accepted[a] = amount;
    }

    function setSale(address sale_) {
        assert (msg.sender == owner);

        sale = sale_;
    } 
}