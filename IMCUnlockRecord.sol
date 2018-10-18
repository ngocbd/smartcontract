/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IMCUnlockRecord at 0xd25adb7e51e1f275c9007dc22b16916ae4849f58
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

    // ?????
    address public executorAddress;
    
    // ????
    mapping(uint => RecordInfo) public unlockRecord;
    
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
     * @param _data string ????
     * @param _fileFormat string ?????????
     * @param _stripLen uint ?????????
     * @return success ????
     */
    function unlockRecordAdd(uint _date, bytes32 _hash, string _data, string _fileFormat, uint _stripLen) public returns (bool) {
        // ?????Owner??????????
        require(msg.sender == executorAddress);
        // ??????
        require(unlockRecord[_date].date != _date);

        // ??????
        unlockRecord[_date] = RecordInfo(_date, _hash, _data, _fileFormat, _stripLen);

        // ??????
        emit UnlockRecordAdd(_date, _hash, _data, _fileFormat, _stripLen);
        
        return true;
        
    }

}