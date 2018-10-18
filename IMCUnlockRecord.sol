/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IMCUnlockRecord at 0x07a450ffe1a4066d1829b2515b26775f4d505bf8
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
contract IMCUnlockRecord is Owned{

    // ????????
    event UnlockRecordAdd(uint _date, bytes32 _hash, string _data, string _fileFormat, uint _stripLen);

    // Token??????
    struct RecordInfo {
        uint date;  // ???????ID?
        bytes32 hash;  // ??hash
        string data; // ????
        string fileFormat; // ?????????
        uint stripLen; // ?????????
    }
    
    // ????
    mapping(uint => RecordInfo) public unlockRecord;
    
    constructor() public{

    }
    
     
    /**
     * ??????
     * @param _date uint ???????ID?
     * @param _hash bytes32 ??hash
     * @param _data string ????
     * @param _fileFormat string ?????????
     * @param _stripLen uint ?????????
     * @return success ????
     */
    function unlockRecordAdd(uint _date, bytes32 _hash, string _data, string _fileFormat, uint _stripLen) public onlyOwner returns (bool) {
        
        // ??????
        require(!(unlockRecord[_date].date > 0));

        // ??????
        unlockRecord[_date] = RecordInfo(_date, _hash, _data, _fileFormat, _stripLen);

        // ??????
        emit UnlockRecordAdd(_date, _hash, _data, _fileFormat, _stripLen);
        
        return true;
        
    }

}