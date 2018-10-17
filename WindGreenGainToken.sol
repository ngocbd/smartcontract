/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WindGreenGainToken at 0x9ac3c30580484a123d86dd00a52f944f8864bd47
*/
pragma solidity ^0.4.24;

/**
 * ??????
 *
 * Symbol       : WGGT
 * Name         : Wind Green Gain Token
 * Total supply : 2,160,000,000.000000000000000000
 * Decimals     : 18
 */


/**
 * Safe maths
 */
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }


    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }


    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }


    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


/**
 * ERC ???? #20 Interface: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 */
contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


/**
 * ??????????????? (Borrowed from MiniMeToken)
 */
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}


/**
 * ???
 */
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


/**
 * ERC20 ???????(??)??????(??)????(???????)???(??????)?????
 */
contract WindGreenGainToken is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;


    /**
     * Constructor
     */
    constructor() public {
        symbol = "WGGT";
        name = "Wind Green Gain Token";
        decimals = 18;
        _totalSupply = 2160000000 * 10**uint(decimals);

        balances[owner] = _totalSupply;
        emit Transfer(address(0), owner, _totalSupply);
    }


    /**
     * ???????
     */
    function totalSupply() public view returns (uint) {
        return _totalSupply.sub(balances[address(0)]);
    }


    /**
     * ? `tokeOwner` ???????????
     */
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }


    /**
     * ?????????? `tokens` ? `to` ?????
     *  - ??????????????????
     *  - ???? 0 ??????
     */
    function transfer(address to, uint tokens) public returns (bool success) {
        require(balances[msg.sender] >= tokens);       // ?????
        require(balances[to] + tokens >= balances[to]);// ????

        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);

        emit Transfer(msg.sender, to, tokens);

        return true;
    }


    /**
     * ????????? `spender` ???????????? transferFrom(...) ???? `tokens`?
     *
     * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md ????????
     * ?????????????? UI ????
     */
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }


    /**
     * ? `from` ????? `tokens` ? `to` ?????
     *
     * ??????????????? `from` ?????????
     */
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }


    /**
     * ????????? `spender` ???? ?????????
     */
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }


    /**
     * ???????? `spender` ???????????? transferFrom(...) ???? `token`??
     * ??? `spender` ? `receiveApproval(...)` ?????
     */
    function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }


    /**
     * ????(??? ETH)?
     */
    function () public payable {
        //revert();
    }


    /**
     * ????????????? ERC20 ???
     */
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }


    function deposit() public payable {
        require(balances[msg.sender] >= msg.value);             // ?????
        require(balances[owner] + msg.value >= balances[owner]);// ????

        balances[msg.sender] = balances[msg.sender].add(msg.value);
    }


    function withdraw(uint withdrawAmount) public {
        if(balances[msg.sender] >= withdrawAmount) {
            balances[msg.sender] -= withdrawAmount;
            msg.sender.transfer(withdrawAmount);
        }
    }
}