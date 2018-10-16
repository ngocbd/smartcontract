/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Pass at 0x92a5df76945031c2525fb29cef70c257b7f148d6
*/
pragma solidity ^0.4.17;

contract Pass {
    address private admin;
    uint private price;
    function Pass() public{
        admin = msg.sender;
        price = 10 ** 15;
    }

    struct PasswordBook{
        string [] platforms;        /// ??
        string [] accounts;         /// ??????
        string [] passwords;        /// ????
    }

    mapping (address => PasswordBook) private userbook;   /// ???? ?????
    mapping (address => uint) private registerUsers;     /// ??????????

    event BookUpdated(address _sender, bool _success);
    /// ????
    function addPassword(string platform, string account, string password) public payable {
        checkLength(platform);
        checkLength(account);
        checkLength(password);
        require(msg.value >= price);
        admin.transfer(msg.value);
        registerUsers[msg.sender] += 1;
        userbook[msg.sender].platforms.push(platform);
        userbook[msg.sender].accounts.push(account);
        userbook[msg.sender].passwords.push(password);
        BookUpdated(msg.sender, true);
    }

    function getBookLength() public view returns (uint){
        return registerUsers[msg.sender];
    }

    function getBook(uint _index) public view returns (string, string, string){
        require(_index>=0);
        require(_index < registerUsers[msg.sender]);
        return (userbook[msg.sender].platforms[_index], userbook[msg.sender].accounts[_index], userbook[msg.sender].passwords[_index]);
    }

    function updatePassword(uint _index, string platform, string account, string password) public payable {
        checkLength(platform);
        checkLength(account);
        checkLength(password);
        if(_index >= registerUsers[msg.sender]) revert();
        require(msg.value >= price);
        admin.transfer(msg.value);
        userbook[msg.sender].platforms[_index] = platform;
        userbook[msg.sender].accounts[_index] = account;
        userbook[msg.sender].passwords[_index] = password;
        BookUpdated(msg.sender, true);
    }

    function updatePrice(uint p) public{
        require(msg.sender == admin);
        price = p;
    }

    function getPrice() public view returns (uint){
        return price;
    }

    function checkLength(string str) private pure {
        bytes memory strBytes = bytes(str);
        if (strBytes.length > 100)
            revert();
    }
}