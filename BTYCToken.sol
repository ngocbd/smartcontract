/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BTYCToken at 0xda9236944915d5247ba72c9973fbe1486b9bb7f4
*/
pragma solidity ^ 0.4 .24;

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
	function add(uint a, uint b) internal pure returns(uint c) {
		c = a + b;
		require(c >= a);
	}

	function sub(uint a, uint b) internal pure returns(uint c) {
		require(b <= a);
		c = a - b;
	}

	function mul(uint a, uint b) internal pure returns(uint c) {
		c = a * b;
		require(a == 0 || c / a == b);
	}

	function div(uint a, uint b) internal pure returns(uint c) {
		require(b > 0);
		c = a / b;
	}
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
	function totalSupply() public constant returns(uint);

	function balanceOf(address tokenOwner) public constant returns(uint balance);

	function allowance(address tokenOwner, address spender) public constant returns(uint remaining);

	function transfer(address to, uint tokens) public returns(bool success);

	function approve(address spender, uint tokens) public returns(bool success);

	function transferFrom(address from, address to, uint tokens) public returns(bool success);

	event Transfer(address indexed from, address indexed to, uint tokens);
	event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
//
// Borrowed from MiniMeToken
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
	function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

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
contract BTYCToken is ERC20Interface, Owned {
	using SafeMath
	for uint;

	string public symbol;
	string public name;
	uint8 public decimals;
	uint _totalSupply;

	uint256 public sellPrice; //???? 1???????? /1000
	uint256 public buyPrice; //???? ???????1??? /1000
	uint256 public sysPrice; //??????
	uint256 public sysPer; //???????? /100

	uint256 public onceOuttime; //????? ??  
	uint256 public onceAddTime; //????? ??

	mapping(address => uint) balances;
	mapping(address => mapping(address => uint)) allowed;

	/* ???? */
	mapping(address => bool) public frozenAccount;
	// ???????????
	//mapping(address => uint256) public freezeOf;
	// ???????????
	//mapping(address => uint256) public canOf;
	struct roundsOwn {
		uint256 addtime; // ????
		uint256 addmoney; // ??
	}
	mapping(address => roundsOwn[]) public mycan;
    mapping(address => uint256) public tradenum;
	// ???????????
	//mapping(address => uint) public cronoutOf;
	// ???????????
	mapping(address => uint) public cronaddOf;

	/* ?? */
	event FrozenFunds(address target, bool frozen);
	// ------------------------------------------------------------------------
	// Constructor
	// ------------------------------------------------------------------------
	constructor() public {

		symbol = "BTYC";
		name = "BTYC Coin";
		decimals = 18;
		_totalSupply = 84000000 * 10 ** uint(decimals);

		sellPrice = 510; //???? 1???????? /1000000
		buyPrice = 526; //???? ???????1??? /1000000
		sysPrice = 766; //??????
		sysPer = 225; //???????? /100

		onceOuttime = 86400; //????? ?? 
		onceAddTime = 864000; //????? ??

		//onceOuttime = 10; //????? ??  
		//onceAddTime = 10; //????? ??
		balances[owner] = _totalSupply;
		emit Transfer(address(0), owner, _totalSupply);

	}

	// ------------------------------------------------------------------------
	// Get the token balance for account `tokenOwner`
	// ------------------------------------------------------------------------

	function balanceOf(address tokenOwner) public view returns(uint balance) {
		return balances[tokenOwner];
	}

	function addmoney(address _addr, uint256 _money) private{
	    roundsOwn stateVar;
	    uint256 _now = now;
	    stateVar.addtime = _now;
	    stateVar.addmoney = _money;
		mycan[_addr].push(stateVar);
		tradenum[_addr] = tradenum[_addr] + 1;
	}


	function getcanuse(address tokenOwner) public view returns(uint balance) {
	    uint256 _now = now;
	    uint256 _left = 0;
	    for(uint256 i = 0; i < tradenum[tokenOwner]; i++) {
	        roundsOwn mydata = mycan[tokenOwner][i];
	        uint256 stime = mydata.addtime;
	        uint256 smoney = mydata.addmoney;
	        uint256 lefttimes = _now - stime;
	        if(lefttimes >= onceOuttime) {
	            uint256 leftpers = lefttimes / onceOuttime;
	            if(leftpers > 100){
	                leftpers = 100;
	            }
	            _left = smoney*leftpers/100 + _left;
	        }
	    }
	    return(_left);
	}

	// ------------------------------------------------------------------------
	// Transfer the balance from token owner's account to `to` account
	// - Owner's account must have sufficient balance to transfer
	// - 0 value transfers are allowed
	// ------------------------------------------------------------------------
	function transfer(address to, uint tokens) public returns(bool success) {
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[to]);
		uint256 canuse = getcanuse(msg.sender);
		require(canuse >= tokens);
		//canOf[msg.sender] = myuseOf(msg.sender);
		//canOf[msg.sender] = canOf[msg.sender].sub(tokens);
		balances[msg.sender] = balances[msg.sender].sub(tokens);
		balances[to] = balances[to].add(tokens);
		addmoney(to, tokens);
		emit Transfer(msg.sender, to, tokens);
		return true;
	}
	/*
	function buytoken(address user, uint256 amount) public{
	    balances[user] = balances[user].sub(amount);
	    //buyeth(amount);
	    emit Transfer(address(0), user, amount);
	}*/

	// ------------------------------------------------------------------------
	// Token owner can approve for `spender` to transferFrom(...) `tokens`
	// from the token owner's account
	//
	// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
	// recommends that there are no checks for the approval double-spend attack
	// as this should be implemented in user interfaces 
	// ------------------------------------------------------------------------
	function approve(address spender, uint tokens) public returns(bool success) {
		allowed[msg.sender][spender] = tokens;
		emit Approval(msg.sender, spender, tokens);
		return true;
	}

	// ------------------------------------------------------------------------
	// Transfer `tokens` from the `from` account to the `to` account
	// 
	// The calling account must already have sufficient tokens approve(...)-d
	// for spending from the `from` account and
	// - From account must have sufficient balance to transfer
	// - Spender must have sufficient allowance to transfer
	// - 0 value transfers are allowed
	// ------------------------------------------------------------------------
	function transferFrom(address from, address to, uint tokens) public returns(bool success) {
		balances[from] = balances[from].sub(tokens);
		allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
		balances[to] = balances[to].add(tokens);
		emit Transfer(from, to, tokens);
		return true;
	}

	// ------------------------------------------------------------------------
	// Returns the amount of tokens approved by the owner that can be
	// transferred to the spender's account
	// ------------------------------------------------------------------------
	function allowance(address tokenOwner, address spender) public view returns(uint remaining) {
		return allowed[tokenOwner][spender];
	}

	// ------------------------------------------------------------------------
	// Token owner can approve for `spender` to transferFrom(...) `tokens`
	// from the token owner's account. The `spender` contract function
	// `receiveApproval(...)` is then executed
	// ------------------------------------------------------------------------
	function approveAndCall(address spender, uint tokens, bytes data) public returns(bool success) {
		allowed[msg.sender][spender] = tokens;
		emit Approval(msg.sender, spender, tokens);
		ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
		return true;
	}

	/// ?? or ????
	function freezeAccount(address target, bool freeze) onlyOwner public {
		frozenAccount[target] = freeze;
		emit FrozenFunds(target, freeze);
	}
	// ????????
	function setPrices(uint256 newBuyPrice, uint256 newSellPrice, uint256 systyPrice, uint256 sysPermit) onlyOwner public {
		buyPrice = newBuyPrice;
		sellPrice = newSellPrice;
		sysPrice = systyPrice;
		sysPer = sysPermit;
	}
	// ???? 
	function getprice() public view returns(uint256 bprice, uint256 spice, uint256 sprice, uint256 sper) {
		bprice = buyPrice;
		spice = sellPrice;
		sprice = sysPrice;
		sper = sysPer;
	}

	// ------------------------------------------------------------------------
	// Total supply
	// ------------------------------------------------------------------------
	function totalSupply() public view returns(uint) {
		return _totalSupply.sub(balances[address(0)]);
	}
	/// ?????????
	function mintToken(address target, uint256 mintedAmount) onlyOwner public {
		require(!frozenAccount[target]);
        if(cronaddOf[msg.sender] < 1) {
			cronaddOf[msg.sender] = now + onceAddTime;
		}
		balances[target] += mintedAmount;
		//_totalSupply -= mintedAmount;
		addmoney(target, mintedAmount);
		//emit Transfer(0, this, mintedAmount);
		emit Transfer(this, target, mintedAmount);

	}
	//????10?????
	function mintme() public {
		require(!frozenAccount[msg.sender]);
		require(now > cronaddOf[msg.sender]);
		uint256 mintAmount = balances[msg.sender] * sysPer / 10000;
		balances[msg.sender] += mintAmount;
		//_totalSupply -= mintAmount;
		cronaddOf[msg.sender] = now + onceAddTime;
		addmoney(msg.sender, mintAmount);
		//emit Transfer(0, this, mintAmount);
		emit Transfer(this, msg.sender, mintAmount);

	}
    
	function buy(uint256 money) public payable returns(uint256 amount) {
		require(!frozenAccount[msg.sender]);
		amount = money * buyPrice;
		balances[msg.sender] += amount;
		balances[this] -= amount;  
		//_totalSupply -= amount;
		addmoney(msg.sender, amount);
		//msg.sender.transfer(money);
		emit Transfer(this, msg.sender, amount); 
		return(amount);
	}

	function() payable public {
		buy(msg.value);
	}
	/*
	function selleth(uint amount) public payable {
	    //address user = msg.sender;
	    //canOf[user] = myuseOf(user);
	    //require(balances[user] >= amount );
	    //uint money = amount * sellPrice;
	   // balances[msg.sender] += money;
	    owner.transfer(amount);
	}*/

	function sell(uint256 amount) public returns(bool success) {
		//address user = msg.sender;
		//canOf[msg.sender] = myuseOf(msg.sender);
		//require(!frozenAccount[msg.sender]);
		uint256 canuse = getcanuse(msg.sender);
		require(canuse >= amount);
		uint moneys = amount / sellPrice;
		require(msg.sender.send(moneys));
		balances[msg.sender] -= amount;
		balances[this] += amount;
		//_totalSupply += amount;
		//canOf[msg.sender] -= amount;
		
		//this.transfer(moneys);Transfer(this, msg.sender, revenue);  
		emit Transfer(this, msg.sender, moneys);
		//canOf[user] -= amount;
		return(true);
	}

}