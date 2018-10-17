/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Formysale at 0xa1e2046fd5bc99c19fd90b7a0b384f9918938080
*/
pragma solidity ^0.4.22;

library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;       
    }       

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Ownable {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
        newOwner = address(0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    modifier onlyNewOwner() {
        require(msg.sender != address(0));
        require(msg.sender == newOwner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0));
        newOwner = _newOwner;
    }

    function acceptOwnership() public onlyNewOwner returns(bool) {
        emit OwnershipTransferred(owner, newOwner);        
        owner = newOwner;
        newOwner = 0x0;
    }
}

contract Pausable is Ownable {
    event Pause();
    event Unpause();

    bool public paused = false;

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }

    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}


contract Whitelist is Ownable {
    uint256 public count;
    using SafeMath for uint256;

    //mapping (uint256 => address) public whitelist;
    mapping (address => bool) public whitelist;
    mapping (uint256 => address) public indexlist;
    mapping (address => uint256) public reverseWhitelist;


    constructor() public {
        count = 0;
    }
    
    function AddWhitelist(address account) public onlyOwner returns(bool) {
        require(account != address(0));
        whitelist[account] = true;
        if( reverseWhitelist[account] == 0 ) {
            count = count.add(1);
            indexlist[count] = account;
            reverseWhitelist[account] = count;
        }
        return true;
    }

    function GetLengthofList() public view returns(uint256) {
        return count;
    }

    function RemoveWhitelist(address account) public onlyOwner {
        require( reverseWhitelist[account] != 0 );
        whitelist[account] = false;
    }

    function GetWhitelist(uint256 index) public view returns(address) {
        return indexlist[index];        
    }
    
    function IsWhite(address account) public view returns(bool) {
        return whitelist[account];
    }
}


contract Formysale is Ownable, Pausable, Whitelist {    
    uint256 public weiRaised;         // ????? Ether ???
    uint256 public personalMincap;    // ?? ?? ?? ?? Ether
    uint256 public personalMaxcap;    // ?? ?? ?? ?? Ether
    uint256 public startTime;         // ???? ????
    uint256 public endTime;           // ???? ????
    uint256 public exchangeRate;      // 1 Ether ? SYNCO ????
    uint256 public remainToken;       // ?? ??? ??? ??
    bool    public isFinalized;       // ????

    uint256 public mtStartTime;       // ???? ?? ?? ??
    uint256 public mtEndTime;         // ???? ?? ?? ??


    mapping (address => uint256) public beneficiaryFunded; //??? : ??? ??
    mapping (address => uint256) public beneficiaryBought; //??? : ??? ??

    event Buy(address indexed beneficiary, uint256 payedEther, uint256 tokenAmount);

    constructor(uint256 _rate) public { 
        startTime = 1532919600;           // 2018? 7? 30? ??? ?? 12:00:00 KST    (2018? 7? 30? Mon AM 3:00:00 GMT)
        endTime = 1534647600;             // 2018? 8? 19? ??? ?? 12:00:00 KST    (2018? 8? 19? Sun AM 3:00:00 GMT)
        remainToken = 6500000000 * 10 ** 18; // 6,500,000,000 ?? ?? ??

        exchangeRate = _rate;
        personalMincap = (1 ether);
        personalMaxcap = (1000 ether);
        isFinalized = false;
        weiRaised = 0x00;
        mtStartTime = 28800;  //?? 5? KST
        mtEndTime = 32400;    //?? 6? KST
    }    

    function buyPresale() public payable whenNotPaused {
        address beneficiary = msg.sender;
        uint256 toFund = msg.value;     // ??? ?? ???? ?(?? ? ??)

        // ?? ???? ???? ? ??? ??
        uint256 tokenAmount = SafeMath.mul(toFund,exchangeRate);
        // check validity
        require(!isFinalized);
        require(validPurchase());       // ???? ??(?? ??? && ???? ?? && gas? && ????? ??)
        require(whitelist[beneficiary]);// WhitList ?????? ??? ?? ??
        require(remainToken >= tokenAmount);// ?? ??? ??? ? ??? ??? ??? ??.
                

        weiRaised = SafeMath.add(weiRaised, toFund);            //????? ???? ???? ??
        remainToken = SafeMath.sub(remainToken, tokenAmount);   //?? ?? ???? ????? ??
        beneficiaryFunded[beneficiary] = SafeMath.add(beneficiaryFunded[msg.sender], toFund);
        beneficiaryBought[beneficiary] = SafeMath.add(beneficiaryBought[msg.sender], tokenAmount);

        emit Buy(beneficiary, toFund, tokenAmount);
        
    }

    function validPurchase() internal view returns (bool) {
        //??? ???? 0.1 ???? ??? ?? ??? Ethere? 1,000? ????? ?? 
        bool validValue = msg.value >= personalMincap && beneficiaryFunded[msg.sender].add(msg.value) <= personalMaxcap;

        //?? ?????? ?? && ????? ??? ?? 
        bool validTime = now >= startTime && now <= endTime && !checkMaintenanceTime();

        return validValue && validTime;
    }

    function checkMaintenanceTime() public view returns (bool){
        uint256 datetime = now % (60 * 60 * 24);
        return (datetime >= mtStartTime && datetime < mtEndTime);
    }

    function getNowTime() public view returns(uint256) {
        return now;
    }

    // Owner only Functions
    function changeStartTime( uint64 newStartTime ) public onlyOwner {
        startTime = newStartTime;
    }

    function changeEndTime( uint64 newEndTime ) public onlyOwner {
        endTime = newEndTime;
    }

    function changePersonalMincap( uint256 newpersonalMincap ) public onlyOwner {
        personalMincap = newpersonalMincap * (1 ether);
    }

    function changePersonalMaxcap( uint256 newpersonalMaxcap ) public onlyOwner {
        personalMaxcap = newpersonalMaxcap * (1 ether);
    }

    function FinishTokenSale() public onlyOwner {
        require(now > endTime || remainToken == 0);
        isFinalized = true;        
        owner.transfer(weiRaised); //????? ???? Owner???? ??.
    }

    function changeRate(uint256 _newRate) public onlyOwner {
        require(checkMaintenanceTime());
        exchangeRate = _newRate; 
    }

    function changeMaintenanceTime(uint256 _startTime, uint256 _endTime) public onlyOwner{
        mtStartTime = _startTime;
        mtEndTime = _endTime;
    }

    // Fallback Function. ???? ???? ??? ?? ??? ??? ?????? ???
    function () public payable {
        buyPresale();
    }

}