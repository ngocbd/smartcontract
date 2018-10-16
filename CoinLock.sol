/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CoinLock at 0xb0f94Af0cfCCC76113BB5bA2C2d89D56221B18A5
*/
contract owned {
    function owned() {
        owner = msg.sender;
    }
    modifier onlyowner() { 
        if (msg.sender == owner)
            _
    }
    address owner;
}
contract CoinLock is owned {
    uint public expiration; // Timestamp in # of seconds.
    
    function lock(uint _expiration) onlyowner returns (bool) {
        if (_expiration > block.timestamp && expiration == 0) {
            expiration = _expiration;
            return true;
        }
        return false;
    }
    function redeem() onlyowner {
        if (block.timestamp > expiration) {
            suicide(owner);
        }
    }
}