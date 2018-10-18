/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Whitelist at 0x02d1987F90F7A31570E6111C5d506B2e48ee30A2
*/
contract Whitelist {

    mapping(address => bool) public whitelist;
    mapping(address => bool) operators;
    address authority;

    constructor(address _authority) {
        authority = _authority;
        operators[_authority] = true;
    }
    
    function add(address _address) public {
        require(operators[msg.sender]);
        whitelist[_address] = true;
    }

    function remove(address _address) public {
        require(operators[msg.sender]);
        whitelist[_address] = false;
    }

    function addOperator(address _address) public {
        require(authority == msg.sender);
        operators[_address] = true;
    }

    function removeOperator(address _address) public {
        require(authority == msg.sender);
        operators[_address] = false;
    }
}