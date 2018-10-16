/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TOGToken at 0xb9d5c2548266428795fd8b1f12aedbdeb417fe54
*/
pragma solidity ^0.4.18;
// ----------------------------------------------------------------------------
// 'TOG' token contract
//
// Deployed to     : 0x916186f2959aC103C458485A2681C0cd805ad7A2
// Symbol          : TOG
// Name            : Tool of God Token
// Total supply    : 1000000000
// Frozen Amount   :  400000000
// First Release   :   50000000
// Seconad Release :   50000000
// Decimals        : 8
//
//
// (c) by Gary.Huang@toxbtc.com.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
contract SafeMath {
    function safeAdd(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint256 a, uint256 b) public pure returns (uint256 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint256 a, uint256 b) public pure returns (uint256 c) {
        require(b > 0);
        c = a / b;
    }
}


contract ERC20Interface {
    function totalSupply() public constant returns (uint256);
    function balanceOf(address tokenOwner) public constant returns (uint256 balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint256 remaining);
    function transfer(address to, uint256 tokens) public returns (bool success);
    function approve(address spender, uint256 tokens) public returns (bool success);
    function transferFrom(address from, address to, uint256 tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}


contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}


contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    function Constructor() public { owner = msg.sender; }

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

contract TOGToken is ERC20Interface, Owned, SafeMath {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint256 public _totalSupply;
    uint256 public _frozeAmount;
    uint256 _firstUnlockAmmount;
    uint256 _secondUnlockAmmount;
    uint256 _firstUnlockTime;
    uint256 _secondUnlockTime;


    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;


    function Constructor() public {
        symbol = "TOG";
        name = "Tool of God Token";
        decimals = 8;               // decimals ??????????????????
        _totalSupply = 1000000000;   // ????10??
        _frozeAmount =  400000000;   // ??4??
        _firstUnlockAmmount  =  50000000;  //???????
        _secondUnlockAmmount =  50000000;  //???????
        balances[msg.sender] = 500000000;
        _firstUnlockTime  = now + 31536000;
        _secondUnlockTime = now + 63072000;
        emit Transfer(address(0), msg.sender, 500000000);
    }

    function totalSupply() public constant returns (uint256) {
        return _totalSupply  - balances[address(0)];
    }

    
    function balanceOf(address tokenOwner) public constant returns (uint256 balance) {
        return balances[tokenOwner];
    }

    function releaseFirstUnlock() public onlyOwner returns (bool success){
        require(now >= _firstUnlockTime);
        require(_firstUnlockAmmount > 0);
        balances[msg.sender] = safeAdd(balances[msg.sender], _firstUnlockAmmount);
        _firstUnlockAmmount = 0;
        emit Transfer(address(0), msg.sender, _firstUnlockAmmount);
        return true;
    }

    function releaseSecondUnlock() public onlyOwner returns (bool success){
        require(now >= _secondUnlockTime);
        require(_secondUnlockAmmount > 0);
        balances[msg.sender] = safeAdd(balances[msg.sender], _secondUnlockAmmount);
        _secondUnlockAmmount = 0;
        emit Transfer(address(0), msg.sender, _secondUnlockAmmount);
        return true;
    }

    function transfer(address to, uint256 tokens) public returns (bool success) {
        require (to != 0x0);                                             // ??????????
        require (balances[msg.sender] >= tokens);                        // ?????????
        require (balances[to] + tokens >= balances[to]);                 // ?????????  
        uint256 previousBalances = balances[msg.sender] + balances[to];  // ??????
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);    // ??
        balances[to] = safeAdd(balances[to], tokens);                    // ??
        emit Transfer(msg.sender, to, tokens);
        assert(balances[msg.sender] + balances[to] == previousBalances); //????????
        return true;
    }

    function approve(address spender, uint256 tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint256 tokens) public returns (bool success) {
        require (to != 0x0);                               // ??????????
        require (balances[from] >= tokens);                // ?????????
        require (balances[to] + tokens >= balances[to]);   // ?????????                    
        uint256 previousBalances = balances[from] + balances[to];
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        assert(balances[from] + balances[to] == previousBalances);
        return true;
    }

    function allowance(address tokenOwner, address spender) public constant returns (uint256 remaining) {
        return allowed[tokenOwner][spender];
    }

    function approveAndCall(address spender, uint256 tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }

    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
}