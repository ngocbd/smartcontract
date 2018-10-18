/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IMCIssuingRecord at 0xcca0fde6a5c9941d4779c1c02c5c6c625756396a
*/
pragma solidity ^0.4.24;

// ----------------------------------------------------------------------------
// 'imChat' token contract
//
// Symbol      : IMC
// Name        : IMC
// Total supply: 1000,000,000.000000000000000000
// Decimals    : 8
//
// imChat Technology Service Limited
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    
    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
        uint256 c = _a + _b;
        require(c >= _a);

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b <= _a);
        uint256 c = _a - _b;

        return c;
    }

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function mul(uint256 _a, uint256 _b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (_a == 0) {
            return 0;
        }

        uint256 c = _a * _b;
        require(c / _a == _b);

        return c;
    }

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = _a / _b;
        assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold

        return c;
    }
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address _owner) public constant returns (uint balance);
    function transfer(address _to, uint _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint _value) public returns (bool success);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address _owner, address _spender) public constant returns (uint remaining);

    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}


// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
//
// Borrowed from MiniMeToken
// ----------------------------------------------------------------------------
interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }


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
// ERC20 Token, with the addition of symbol, name and decimals and a
// fixed supply
// ----------------------------------------------------------------------------
contract IMCToken is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    address externalContractAddress;


    /**
     * ????
     */
    constructor() public {
        symbol = "IMC";
        name = "IMC";
        decimals = 8;
        _totalSupply = 1000000000 * (10 ** uint(decimals));
        balances[owner] = _totalSupply;
        
        emit Transfer(address(0), owner, _totalSupply);
    }

    /**
     * ????????
     * @return unit ??
     */
    function totalSupply() public view returns (uint) {
        return _totalSupply.sub(balances[address(0)]);
    }

    /**
     * ??????
     * @param _owner address ???????
     * @return balance ??
     */
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }

    /**
     * ???????????????????
     * @param _from address ???????
     * @param _to address ???????
     * @param _value uint ???????
     */
    function _transfer(address _from, address _to, uint _value) internal{
        // ????????0x0???0x0??????
        require(_to != 0x0);
        // ?????????????
        require(balances[_from] >= _value);
        // ??????
        require(balances[_to] + _value > balances[_to]);

        // ???????????
        uint previousBalance = balances[_from].add(balances[_to]);

        // ?????????
        balances[_from] = balances[_from].sub(_value);
        // ??????????
        balances[_to] = balances[_to].add(_value);

        // ?????????????
        emit Transfer(_from, _to, _value);

        // ???????????????????
        assert(balances[_from].add(balances[_to]) == previousBalance);
    }

    /**
     * ????????????????
     * @param _to address ???????
     * @param _value uint ???????
     * @return success ????
     */
    function transfer(address _to, uint _value) public returns (bool success) {
        // _transfer(msg.sender, _to, _value);

        if (msg.sender == owner) {
            // ERC20??owner??
            _transfer(msg.sender, _to, _value);

            return true;
        } else {
            // ???????????????????????????????????
            require(msg.sender == externalContractAddress);

            _transfer(owner, _to, _value);

            return true;
        }
    }

    /**
     * ?????????????????????????????
     * @param _from address ?????
     * @param _to address ?????
     * @param _value uint ????????
     * @return success ????
     */
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        
        if (_from == msg.sender) {
            // ????????approve?????????
            _transfer(_from, _to, _value);

        } else {
            // ??????????????????????
            require(allowed[_from][msg.sender] >= _value);
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);

            _transfer(_from, _to, _value);

        }

        return true;
    }

    /**
    * ??????????????????
    * @param _spender ??????
    * @param _value ????
    * @return success ????
    */
    function approve(address _spender, uint _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    /**
    * ????????????????
    * @param _owner ???????
    * @param _spender ????????
    * @return remaining ????
    */
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }

    /**
     * ??????????????????????????????????
     * @param _spender ??????????
     * @param _value ????????
     * @param _extraData ??????????
     * @return success ????
     */
    function approveAndCall(address _spender, uint _value, bytes _extraData) public returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            // ????
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    /**
     * ????????????????
     * @param _contractAddress ????
     * @return success ????
     */
    function approveContractCall(address _contractAddress) public onlyOwner returns (bool){
        externalContractAddress = _contractAddress;
        
        return true;
    }

    /**
     * ??? Ether
     */
    function () public payable {
        revert();
    }
}

// ----------------------------------------------------------------------------
// ??????
// ----------------------------------------------------------------------------
contract IMCIssuingRecord is Owned{
    using SafeMath for uint;

    // ????????
    event IssuingRecordAdd(uint _date, bytes32 _hash, uint _depth, uint _userCount, uint _token, string _fileFormat, uint _stripLen);

    // ??IMCToken??
    IMCToken public imcToken;

    // ??????
    address platformAddr;

    // Token??????
    struct RecordInfo {
        uint date;  // ???????ID?
        bytes32 hash;  // ??hash
        uint depth; // ??
        uint userCount; // ???
        uint token; // ??token??
        string fileFormat; // ?????????
        uint stripLen; // ?????????
    }
    
    // ????
    mapping(uint => RecordInfo) public issuingRecord;
    
    // ???
    uint public userCount;
    
    // ?????
    uint public totalIssuingBalance;
    
    /**
     * ????
     * @param _tokenAddr address ERC20????
     * @param _platformAddr address ??????
     */
    constructor(address _tokenAddr, address _platformAddr) public{
        // ???IMCToken??
        imcToken = IMCToken(_tokenAddr);

        // ?????????
        platformAddr = _platformAddr;
    }
    
    /**
     * ??platformAddr???owner????
     * @param _addr address ??
     */
    function modifyPlatformAddr(address _addr) public onlyOwner {
        platformAddr = _addr;
    }

    /**
     * ???????
     * @param _tokens uint ???
     * @return success ????
     */
    function sendTokenToPlatform(uint _tokens) internal returns (bool) {

        imcToken.transfer(platformAddr, _tokens);
        
        return true;
    }

    /**
     * ??????
     * @param _date uint ???????ID?
     * @param _hash bytes32 ??hash
     * @param _depth uint ??
     * @param _userCount uint ???
     * @param _token uint ??token??
     * @param _fileFormat string ?????????
     * @param _stripLen uint ?????????
     * @return success ????
     */
    function issuingRecordAdd(uint _date, bytes32 _hash, uint _depth, uint _userCount, uint _token, string _fileFormat, uint _stripLen) public onlyOwner returns (bool) {
        // ??????
        require(!(issuingRecord[_date].date > 0));

        // ?????
        userCount = userCount.add(_userCount);

        // ??????
        totalIssuingBalance = totalIssuingBalance.add(_token);
        
        // ??????
        issuingRecord[_date] = RecordInfo(_date, _hash, _depth, _userCount, _token, _fileFormat, _stripLen);

        // ???????
        sendTokenToPlatform(_token);

        emit IssuingRecordAdd(_date, _hash, _depth, _userCount, _token, _fileFormat, _stripLen);
        
        return true;
        
    }

}