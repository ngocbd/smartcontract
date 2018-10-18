/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IMCLedgerRecord at 0xfdb9a98af7216818a8e07dad21122f02361a2a83
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
    
    // ????
    mapping(uint => RecordInfo) public ledgerRecord;
    
    constructor() public{

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
    function ledgerRecordAdd(uint _date, bytes32 _hash, uint _depth, string _fileFormat, uint _stripLen, bytes32 _balanceHash, uint _balanceDepth) public onlyOwner returns (bool) {
        
        // ??????
        require(!(ledgerRecord[_date].date > 0));

        // ??????
        ledgerRecord[_date] = RecordInfo(_date, _hash, _depth, _fileFormat, _stripLen, _balanceHash, _balanceDepth);

        // ??????
        emit LedgerRecordAdd(_date, _hash, _depth, _fileFormat, _stripLen, _balanceHash, _balanceDepth);
        
        return true;
        
    }

}