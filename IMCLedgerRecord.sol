/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IMCLedgerRecord at 0x78325d42be3130ba6afa3c3f88b989f8b85ded29
*/
pragma solidity ^0.4.24;

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

// ----------------------------------------------------------------------------
// ??????
// ----------------------------------------------------------------------------
contract IMCLedgerRecord is Owned{

    // ????????
    event LedgerRecordAdd(uint _date, bytes32 _hash, uint _depth, string _fileFormat, uint _stripLen, bytes32 _balanceHash, uint _balanceDepth);

    // Token??????
    struct RecordInfo {
        uint date;  // ???????ID?
        bytes32 hash;  // ??hash
        uint depth; // ??
        string fileFormat; // ?????????
        uint stripLen; // ?????????
        bytes32 balanceHash;  // ????hash
        uint balanceDepth;  // ????
    }

    // ?????
    address public executorAddress;
    
    // ????
    mapping(uint => RecordInfo) public ledgerRecord;
    
    constructor() public{
        // ????????
        executorAddress = msg.sender;
    }
    
    /**
     * ??executorAddress???owner????
     * @param _addr address ??
     */
    function modifyExecutorAddr(address _addr) public onlyOwner {
        executorAddress = _addr;
    }
    
     
    /**
     * ??????
     * @param _date uint ???????ID?
     * @param _hash bytes32 ??hash
     * @param _depth uint ??
     * @param _fileFormat string ?????????
     * @param _stripLen uint ?????????
     * @param _balanceHash bytes32 ????hash
     * @param _balanceDepth uint ????
     * @return success ????
     */
    function ledgerRecordAdd(uint _date, bytes32 _hash, uint _depth, string _fileFormat, uint _stripLen, bytes32 _balanceHash, uint _balanceDepth) public returns (bool) {
        // ?????Owner??????????
        require(msg.sender == executorAddress);
        // ??????
        require(ledgerRecord[_date].date != _date);

        // ??????
        ledgerRecord[_date] = RecordInfo(_date, _hash, _depth, _fileFormat, _stripLen, _balanceHash, _balanceDepth);

        // ??????
        emit LedgerRecordAdd(_date, _hash, _depth, _fileFormat, _stripLen, _balanceHash, _balanceDepth);
        
        return true;
        
    }

}