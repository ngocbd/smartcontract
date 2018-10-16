/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CapWhitelist at 0xbe4ee9566e5f5ccd4793af0aa34d7e5031c9e00c
*/
contract CapWhitelist {
    address public owner;
    mapping (address => uint256) public whitelist;

    event Set(address _address, uint256 _amount);

    function CapWhitelist() {
        owner = msg.sender;
        // Set in prod
    }

    function destruct() {
        require(msg.sender == owner);
        selfdestruct(owner);
    }

    function setWhitelisted(address _address, uint256 _amount) {
        require(msg.sender == owner);
        setWhitelistInternal(_address, _amount);
    }

    function setWhitelistInternal(address _address, uint256 _amount) private {
        whitelist[_address] = _amount;
        Set(_address, _amount);
    }
}