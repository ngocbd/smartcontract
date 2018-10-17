/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CRYPTToken at 0xe9b6f0c4f253bb5cfc5e814b9e93361dfe517e57
*/
// ??????? ?????? - 9 ???????? ??? ????????????? ? Rinkeby
// ????????? ???????? ? require
// ?????????? ?-?? refund
// ?????????? ????????? ??????? ?? ???? ?????? ICO ? Crowdsale
// ???????? ??? ? refund
// ????????? ??????? ??????????\????????????? ??????? ????????? ? ??????? ?????? ?????????
// ??? ??????????? ??????? ??????????
// CRYPT Token = > CRYPT
// CRTT => CRT
// ???????? ?-??? ??????? ???????. ????????? ??????? ?????? ????? ?????? ? 4-? ????????????????? ???????
// ? fallback ??????? ???????? ???? ??????? ???????????? ????????, ???? ????? ????????? 
// ? ?????????????? ????? ???????? ?? ????????? ???????????? ??????? (?????=30 ?????)

//- ?????? ?? ?????? 0.4 ETH = 2 000 ???????
//- ?????? ?? ??????? 1 ????? 
//- ????? ????? ???????? - 1 ????? 
//* ??????????? ?????? ?? PRESALE 0.1 ETH 
//* ???????????? ?????? ?? PREICO 0.1 ETH
// ????? ???????? = 50 000 ???????
// HardCap 40% = 20 000 ??????? = 4 ETH



pragma solidity ^0.4.23;


contract ERC20Basic {
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender)
        public view returns (uint256);

    function transferFrom(address from, address to, uint256 value)
        public returns (bool);

    function approve(address spender, uint256 value) public returns (bool);
    event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
    );
}



library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}



contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
  
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

}


contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) internal allowed;

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        public
        returns (bool)
    {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }


    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(
        address _owner,
        address _spender
    )
    public
    view
    returns (uint256)
    {
        return allowed[_owner][_spender];
    }


    function increaseApproval(
        address _spender,
        uint _addedValue
    )
    public
    returns (bool)
    {
        allowed[msg.sender][_spender] = (
        allowed[msg.sender][_spender].add(_addedValue));
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }


    function decreaseApproval(
        address _spender,
        uint _subtractedValue
    )
        public
        returns (bool)
    {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}


contract CRYPTToken is StandardToken {
    string public constant name = "CRYPT Test Token";
    string public constant symbol = "CRTT";
    uint32 public constant decimals = 18;
    uint256 public INITIAL_SUPPLY = 50000 * 1 ether;
    address public CrowdsaleAddress;
    bool public lockTransfers = false;

    constructor(address _CrowdsaleAddress) public {
    
        CrowdsaleAddress = _CrowdsaleAddress;
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;      
    }
  
    modifier onlyOwner() {
        // only Crowdsale contract
        require(msg.sender == CrowdsaleAddress);
        _;
    }

     // Override
    function transfer(address _to, uint256 _value) public returns(bool){
        if (msg.sender != CrowdsaleAddress){
            require(!lockTransfers, "Transfers are prohibited in ICO and Crowdsale period");
        }
        return super.transfer(_to,_value);
    }

     // Override
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool){
        if (msg.sender != CrowdsaleAddress){
            require(!lockTransfers, "Transfers are prohibited in ICO and Crowdsale period");
        }
        return super.transferFrom(_from,_to,_value);
    }
     
    function acceptTokens(address _from, uint256 _value) public onlyOwner returns (bool){
        require (balances[_from] >= _value);
        balances[_from] = balances[_from].sub(_value);
        balances[CrowdsaleAddress] = balances[CrowdsaleAddress].add(_value);
        emit Transfer(_from, CrowdsaleAddress, _value);
        return true;
    }

    function lockTransfer(bool _lock) public onlyOwner {
        lockTransfers = _lock;
    }



    function() external payable {
        // The token contract don`t receive ether
        revert();
    }  
}