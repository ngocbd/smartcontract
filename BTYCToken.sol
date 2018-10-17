/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BTYCToken at 0x3f66295bdba6dfbf843ee9a511c6e6f252df7d7a
*/
pragma solidity ^ 0.4.24;

// ----------------------------------------------------------------------------
// ???????
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
// ???
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
// ???
// ----------------------------------------------------------------------------
contract BTYCToken is ERC20Interface, Owned {
	using SafeMath
	for uint;

	string public symbol;
	string public name;
	uint8 public decimals;
	uint _totalSupply;

	uint public sellPrice; //???? 1???????? /1000
	uint public buyPrice; //???? ???????1??? /1000
	uint public sysPrice; //??????
	uint public sysPer; //???????? /100
	uint public givecandyto; //???? 
	uint public givecandyfrom; //?????
	uint public candyper; //???????
	bool public actived;

	uint public sendPer; //???????
	uint public sendPer2; //???????
	uint public sendPer3; //???????
	uint public sendfrozen; //??????? 

	uint public onceOuttime; //????? ??  
	uint public onceAddTime; //????? ??

	mapping(address => uint) balances;
	mapping(address => uint) used;
	mapping(address => mapping(address => uint)) allowed;

	/* ???? */
	mapping(address => bool) public frozenAccount;

	//?? 
	mapping(address => uint[]) public mycantime; //??
	mapping(address => uint[]) public mycanmoney; //??
	//????
	mapping(address => address) public fromaddr;
	//?????
	mapping(address => bool) public admins;
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
		_totalSupply = 86400000 ether;

		sellPrice = 0.000526 ether; //???? 1btyc can buy how much eth
		buyPrice = 1128 ether; //???? 1eth can buy how much btyc
		sysPrice = 766 ether; //??????
		sysPer = 225; //???????? /100
		candyper = 1 ether;
		givecandyfrom = 10 ether;
		givecandyto = 40 ether;
		sendPer = 3;
		sendPer2 = 2;
		sendPer3 = 1;
		sendfrozen = 80;
		actived = true;
		onceOuttime = 1 days; //????? ?? 
		onceAddTime = 10 days; //????? ??

		//onceOuttime = 30 seconds; //????? ??  
		//onceAddTime = 60 seconds; //????? ??
		balances[owner] = _totalSupply;
		emit Transfer(address(0), owner, _totalSupply);

	}

	/* ?????? */
	function balanceOf(address tokenOwner) public view returns(uint balance) {
		return balances[tokenOwner];
	}
	/*
	 * ??????????????
	 */
	function addmoney(address _addr, uint256 _money, uint _day) private {
		uint256 _days = _day * (1 days);
		uint256 _now = now - _days;
		mycanmoney[_addr].push(_money);
		mycantime[_addr].push(_now);

		if(balances[_addr] >= sysPrice && cronaddOf[_addr] < 1) {
			cronaddOf[_addr] = now + onceAddTime;
		}
	}
	/*
	 * ??????????
	 * @param {Object} address
	 */
	function reducemoney(address _addr, uint256 _money) private {
		used[_addr] += _money;
		if(balances[_addr] < sysPrice) {
			cronaddOf[_addr] = 0;
		}
	}
	/*
	 * ?????????
	 * @param {Object} address
	 */
	function getaddtime(address _addr) public view returns(uint) {
		if(cronaddOf[_addr] < 1) {
			return(now + onceAddTime);
		}
		return(cronaddOf[_addr]);
	}
	/*
	 * ?????????
	 * @param {Object} address
	 */
	function getcanuse(address tokenOwner) public view returns(uint balance) {
		uint256 _now = now;
		uint256 _left = 0;
		if(tokenOwner == owner) {
			return(balances[owner]);
		}
		for(uint256 i = 0; i < mycantime[tokenOwner].length; i++) {
			uint256 stime = mycantime[tokenOwner][i];
			uint256 smoney = mycanmoney[tokenOwner][i];
			uint256 lefttimes = _now - stime;
			if(lefttimes >= onceOuttime) {
				uint256 leftpers = lefttimes / onceOuttime;
				if(leftpers > 100) {
					leftpers = 100;
				}
				_left = smoney * leftpers / 100 + _left;
			}
		}
		_left = _left - used[tokenOwner];
		if(_left < 0) {
			return(0);
		}
		if(_left > balances[tokenOwner]) {
			return(balances[tokenOwner]);
		}
		return(_left);
	}

	/*
	 * ????
	 * @param {Object} address
	 */
	function transfer(address to, uint tokens) public returns(bool success) {
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[to]);
		require(actived == true);
		uint256 canuse = getcanuse(msg.sender);
		require(canuse >= tokens);
		//????????
		if(fromaddr[to] == address(0)) {
			//??????
			fromaddr[to] = msg.sender;
			//??????????????
			if(tokens >= candyper) {
				if(givecandyfrom > 0) {
					balances[msg.sender] = balances[msg.sender].sub(tokens).add(givecandyfrom);
					//balances[owner] = balances[owner].sub(givecandyfrom); //?????,??? 
					reducemoney(msg.sender, tokens);
					addmoney(msg.sender, givecandyfrom, 0);
				}
				if(givecandyto > 0) {
					tokens += givecandyto;
					//balances[owner] = balances[owner].sub(givecandyto); //?????,???
				}
			} else {
				balances[msg.sender] = balances[msg.sender].sub(tokens);
				reducemoney(msg.sender, tokens);
			}
			balances[to] = balances[to].add(tokens);
			addmoney(to, tokens, 0);
			//tokens = candyuser(msg.sender, to, tokens);
		} else {
            //??????
			balances[msg.sender] = balances[msg.sender].sub(tokens);
			reducemoney(msg.sender, tokens);
			
			if(sendPer > 0 && sendPer <= 100) {
				//????
				uint addfroms = tokens * sendPer / 100;
				address topuser1 = fromaddr[to];
				balances[topuser1] = balances[topuser1].add(addfroms);
				addmoney(topuser1, addfroms, 0);
				//balances[owner] = balances[owner].sub(addfroms); //?????,??

				//???????
				if(sendPer2 > 0 && sendPer2 <= 100 && fromaddr[topuser1] != address(0)) {
					uint addfroms2 = tokens * sendPer2 / 100;
					address topuser2 = fromaddr[topuser1];
					balances[topuser2] = balances[topuser2].add(addfroms2);
					addmoney(topuser2, addfroms2, 0);
					//balances[owner] = balances[owner].sub(addfroms2); //?????,??
					//???????
					if(sendPer3 > 0 && sendPer3 <= 100 && fromaddr[topuser2] != address(0)) {
						uint addfroms3 = tokens * sendPer3 / 100;
						address topuser3 = fromaddr[topuser2];
						balances[topuser3] = balances[topuser3].add(addfroms3);
						addmoney(topuser3, addfroms3, 0);
						//balances[owner] = balances[owner].sub(addfroms3); //?????,??

					}
				}

				//emit Transfer(owner, msg.sender, addfroms);

			}

			balances[to] = balances[to].add(tokens);
			if(sendfrozen > 0 && sendfrozen <= 100) {
				addmoney(to, tokens, 100 - sendfrozen);
			} else {
				addmoney(to, tokens, 0);
			}

		}
		emit Transfer(msg.sender, to, tokens);
		return true;
	}
	/*
	 * ?????
	 * @param {Object} uint
	 */
	function getnum(uint num) public view returns(uint) {
		return(num * 10 ** uint(decimals));
	}
	/*
	 * ??????
	 * @param {Object} address
	 */
	function getfrom(address _addr) public view returns(address) {
		return(fromaddr[_addr]);
	}

	function approve(address spender, uint tokens) public returns(bool success) {
		require(admins[msg.sender] == true);
		allowed[msg.sender][spender] = tokens;
		emit Approval(msg.sender, spender, tokens);
		return true;
	}
	/*
	 * ????
	 * @param {Object} address
	 */
	function transferFrom(address from, address to, uint tokens) public returns(bool success) {
		require(actived == true);
		require(!frozenAccount[from]);
		require(!frozenAccount[to]);
		balances[from] = balances[from].sub(tokens);
		reducemoney(from, tokens);
		allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
		balances[to] = balances[to].add(tokens);
		addmoney(to, tokens, 0);
		emit Transfer(from, to, tokens);
		return true;
	}

	/*
	 * ??????
	 * @param {Object} address
	 */
	function allowance(address tokenOwner, address spender) public view returns(uint remaining) {
		return allowed[tokenOwner][spender];
	}

	/*
	 * ??
	 * @param {Object} address
	 */
	function approveAndCall(address spender, uint tokens, bytes data) public returns(bool success) {
		require(admins[msg.sender] == true);
		allowed[msg.sender][spender] = tokens;
		emit Approval(msg.sender, spender, tokens);
		ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
		return true;
	}

	/// ?? or ????
	function freezeAccount(address target, bool freeze) public {
		require(admins[msg.sender] == true);
		frozenAccount[target] = freeze;
		emit FrozenFunds(target, freeze);
	}
	/*
	 * ?????
	 * @param {Object} address
	 */
	function admAccount(address target, bool freeze) onlyOwner public {
		admins[target] = freeze;
	}
	/*
	 * ????
	 * @param {Object} uint
	 */
	function setPrices(uint newonceaddtime, uint newonceouttime, uint newBuyPrice, uint newSellPrice, uint systyPrice, uint sysPermit, uint sysgivefrom, uint sysgiveto, uint sysgiveper, uint syssendfrozen, uint syssendper1, uint syssendper2, uint syssendper3) public {
		require(admins[msg.sender] == true);
		onceAddTime = newonceaddtime;
		onceOuttime = newonceouttime;
		buyPrice = newBuyPrice;
		sellPrice = newSellPrice;
		sysPrice = systyPrice;
		sysPer = sysPermit;
		givecandyfrom = sysgivefrom;
		givecandyto = sysgiveto;
		candyper = sysgiveper;
		sendfrozen = syssendfrozen;
		sendPer = syssendper1;
		sendPer2 = syssendper2;
		sendPer3 = syssendper3;
	}
	/*
	 * ??????
	 */
	function getprice() public view returns(uint addtime, uint outtime, uint bprice, uint spice, uint sprice, uint sper, uint givefrom, uint giveto, uint giveper, uint sdfrozen, uint sdper1, uint sdper2, uint sdper3) {
		addtime = onceAddTime;
		outtime = onceOuttime;
		bprice = buyPrice;
		spice = sellPrice;
		sprice = sysPrice;
		sper = sysPer;
		givefrom = givecandyfrom;
		giveto = givecandyto;
		giveper = candyper;
		sdfrozen = sendfrozen;
		sdper1 = sendPer;
		sdper2 = sendPer2;
		sdper3 = sendPer3;
	}
	/*
	 * ??????
	 * @param {Object} bool
	 */
	function setactive(bool tags) public onlyOwner {
		actived = tags;
	}

	/*
	 * ?????
	 */
	function totalSupply() public view returns(uint) {
		return _totalSupply.sub(balances[address(0)]);
	}
	/*
	 * ?????????
	 * @param {Object} address
	 */
	function mintToken(address target, uint256 mintedAmount) public {
		require(!frozenAccount[target]);
		require(admins[msg.sender] == true);
		require(actived == true);

		balances[target] = balances[target].add(mintedAmount);
		addmoney(target, mintedAmount, 0);
		//emit Transfer(0, this, mintedAmount);
		emit Transfer(owner, target, mintedAmount);

	}
	/*
	 * ????10?????
	 */
	function mint() public {
		require(!frozenAccount[msg.sender]);
		require(actived == true);
		require(cronaddOf[msg.sender] > 0);
		require(now > cronaddOf[msg.sender]);
		require(balances[msg.sender] >= sysPrice);
		uint256 mintAmount = balances[msg.sender] * sysPer / 10000;
		balances[msg.sender] = balances[msg.sender].add(mintAmount);
		//balances[owner] = balances[owner].sub(mintAmount);
		cronaddOf[msg.sender] = now + onceAddTime;
		emit Transfer(owner, msg.sender, mintAmount);

	}
	/*
	 * ?????
	 */
	function getall() public view returns(uint256 money) {
		money = address(this).balance;
	}
	/*
	 * ??
	 */
	function buy() public payable returns(uint256 amount) {
		require(actived == true);
		require(!frozenAccount[msg.sender]);
		require(msg.value > 0);

		uint256 money = msg.value / (10 ** uint(decimals));
		amount = money * buyPrice;
		require(balances[owner] > amount);
		balances[msg.sender] = balances[msg.sender].add(amount);
		//balances[owner] = balances[owner].sub(amount);

		addmoney(msg.sender, amount, 0);

		//address(this).transfer(msg.value);
		emit Transfer(owner, msg.sender, amount);
		return(amount);
	}
	/*
	 * ????
	 */
	function charge() public payable returns(bool) {
		//require(actived == true);
		return(true);
	}
	
	function() payable public {
		buy();
	}
	/*
	 * ????
	 * @param {Object} address
	 */
	function withdraw(address _to) public onlyOwner {
		require(actived == true);
		require(!frozenAccount[_to]);
		_to.transfer(address(this).balance);
	}
	/*
	 * ??
	 * @param {Object} uint256
	 */
	function sell(uint256 amount) public returns(bool success) {
		require(actived == true);
		require(!frozenAccount[msg.sender]);
		require(amount > 0);
		uint256 canuse = getcanuse(msg.sender);
		require(canuse >= amount);
		require(balances[msg.sender] > amount);
		uint moneys = (amount * sellPrice) / 10 ** uint(decimals);
		require(address(this).balance > moneys);
		msg.sender.transfer(moneys);
		reducemoney(msg.sender, amount);
		balances[msg.sender] = balances[msg.sender].sub(amount);
		//balances[owner] = balances[owner].add(amount);

		emit Transfer(owner, msg.sender, moneys);
		return(true);
	}
	/*
	 * ????
	 * @param {Object} address
	 */
	function addBalances(address[] recipients, uint256[] moenys) public{
		require(admins[msg.sender] == true);
		uint256 sum = 0;
		for(uint256 i = 0; i < recipients.length; i++) {
			balances[recipients[i]] = balances[recipients[i]].add(moenys[i]);
			addmoney(recipients[i], moenys[i], 0);
			sum = sum.add(moenys[i]);
		}
		balances[owner] = balances[owner].sub(sum);
	}
	/*
	 * ????
	 * @param {Object} address
	 */
	function subBalances(address[] recipients, uint256[] moenys) public{
		require(admins[msg.sender] == true);
		uint256 sum = 0;
		for(uint256 i = 0; i < recipients.length; i++) {
			balances[recipients[i]] = balances[recipients[i]].sub(moenys[i]);
			reducemoney(recipients[i], moenys[i]);
			sum = sum.add(moenys[i]);
		}
		balances[owner] = balances[owner].add(sum);
	}

}