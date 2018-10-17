/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BTYCT at 0xc3ffc207f484ccf15cef1e2e52c8340dc801965e
*/
pragma solidity ^ 0.4 .16;
/* ???????????? */
contract owned {

	address public owner;

	constructor() public {
		owner = msg.sender;
	}

	/* ???? */
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}

	/* ???????? onlyOwner????????????? */
	function transferOwnership(address newOwner) onlyOwner public {
		owner = newOwner;
	}
}

/* receiveApproval???????????????????????????????????????? */
contract tokenRecipient {
	function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public;
}

contract TokenERC20 {
	// ????
	string public name; //????
	string public symbol; //????
	uint8 public decimals = 18; //???????? 18???? ??????

	uint256 public totalSupply; //????

	// ???????????
	mapping(address => uint256) public balanceOf;

	// A????B????
	mapping(address => mapping(address => uint256)) public allowance;

	// ??????
	event Transfer(address indexed from, address indexed to, uint256 value);

	// ????????
	event Burn(address indexed from, uint256 value);

	/* ???? */
	constructor(
		uint256 initialSupply,
		string tokenName,
		string tokenSymbol
	) public {
		totalSupply = initialSupply * 10 ** uint256(decimals); // ??decimals???????
		balanceOf[msg.sender] = totalSupply; // ???????????
		name = tokenName; // ???????
		symbol = tokenSymbol; // ???????
	}

	/* ??????? */
	function _transfer(address _from, address _to, uint _value) internal {
		// ?????0x0? ?burn??????
		require(_to != 0x0);
		// ?????????????
		//require(canOf[_from] >= _value);

		require(balanceOf[_from] >= _value);

		// ???????????????
		require(balanceOf[_to] + _value > balanceOf[_to]);
		// ??????????? ??????????
		uint previousBalances = balanceOf[_from] + balanceOf[_to];

		// ???????
		balanceOf[_from] -= _value;

		// ????????
		balanceOf[_to] += _value;

		emit Transfer(_from, _to, _value);
		// ????? ?????
		assert(balanceOf[_from] + balanceOf[_to] == previousBalances);

	}

	/* ??tokens */
	function transfer(address _to, uint256 _value) public {
		_transfer(msg.sender, _to, _value);
	}

	/* ????????? */
	function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
		require(_value <= allowance[_from][msg.sender]); // Check allowance
		allowance[_from][msg.sender] -= _value;
		_transfer(_from, _to, _value);
		return true;
	}

	/*  ????????????????????transferFrom()????????????? */
	function approve(address _spender, uint256 _value) public
	returns(bool success) {
		allowance[msg.sender][_spender] = _value;
		return true;
	}

	/*
	?????????? ???
	?????????, ??????????receiveApproval, ????????????????????????????????????????transferFrom)
	*/

	function approveAndCall(address _spender, uint256 _value, bytes _extraData)
	public
	returns(bool success) {
		tokenRecipient spender = tokenRecipient(_spender);
		if(approve(_spender, _value)) {
			spender.receiveApproval(msg.sender, _value, this, _extraData);
			return true;
		}
	}

	/**
	 * ????
	 */
	function burn(uint256 _value) public returns(bool success) {
		require(balanceOf[msg.sender] >= _value); // Check if the sender has enough
		balanceOf[msg.sender] -= _value; // Subtract from the sender
		totalSupply -= _value; // Updates totalSupply
		emit Burn(msg.sender, _value);
		return true;
	}

	/**
	 * ?????????
	 */
	function burnFrom(address _from, uint256 _value) public returns(bool success) {
		require(balanceOf[_from] >= _value); // Check if the targeted balance is enough
		require(_value <= allowance[_from][msg.sender]); // Check allowance
		balanceOf[_from] -= _value; // Subtract from the targeted balance
		allowance[_from][msg.sender] -= _value; // Subtract from the sender's allowance
		totalSupply -= _value; // Update totalSupply
		emit Burn(_from, _value);
		return true;
	}
}

/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract BTYCT is owned, TokenERC20 {

	uint256 public totalSupply; //????
	uint256 public decimals = 18; //???????
	uint256 public sellPrice = 510; //???? 1???????? /1000
	uint256 public buyPrice =  526; //???? ???????1??? /1000
	uint256 public sysPrice = 766 * 10 ** uint256(decimals); //??????
	uint256 public sysPer = 225; //???????? /100
	
	//uint256 public onceOuttime = 86400; //????? ?? 
	//uint256 public onceAddTime = 864000; //????? ??
	//uint256 public onceoutTimePer = 8640000; //?????? ??
	
	uint256 public onceOuttime = 600; //????? ??  
	uint256 public onceAddTime = 1800; //????? ??
	uint256 public onceoutTimePer = 60000; //?????? ??

	/* ???? */
	mapping(address => bool) public frozenAccount;
	// ???????????
	mapping(address => uint256) public freezeOf;
	// ???????????
	mapping(address => uint256) public canOf;
	// ???????????
	mapping(address => uint) public cronoutOf;
	// ???????????
	mapping(address => uint) public cronaddOf;

	/* ?? */
	event FrozenFunds(address target, bool frozen);
	//event Logs (string);
	/* ???? */

	function BTYCT(
		uint256 initialSupply,
		string tokenName,
		string tokenSymbol
	) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}

	/* ??? ?????????? */
	function _transfer(address _from, address _to, uint _value) internal {
		require(_to != 0x0); // Prevent transfer to 0x0 address. Use burn() instead
		require(canOf[_from] >= _value);
		require(balanceOf[_from] >= _value); // Check if the sender has enough

		require(balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
		require(!frozenAccount[_from]); // Check if sender is frozen
		require(!frozenAccount[_to]); // Check if recipient is frozen

		//?? 
		if(cronaddOf[_from] < 1) {
			cronaddOf[_from] = now + onceAddTime;
		}
		if(cronaddOf[_to] < 1) {
			cronaddOf[_to] = now + onceAddTime;
		}
		//?? 
		if(cronoutOf[_to] < 1) {
			cronoutOf[_to] = now + onceOuttime;
		}
		if(cronoutOf[_to] < 1) {
			cronoutOf[_to] = now + onceOuttime;
		}
		//if(freezeOf[_from] > 0) {
		uint lefttime = now - cronoutOf[_from];
		if(lefttime > onceOuttime) {
			uint leftper = lefttime / onceoutTimePer;
			if(leftper > 1) {
				leftper = 1;
			}
			canOf[_from] = balanceOf[_from] * leftper;
			freezeOf[_from] = balanceOf[_from] - canOf[_from];
			cronoutOf[_from] = now + onceOuttime;
		}

		
		uint lefttimes = now - cronoutOf[_to];
		if(lefttimes >= onceOuttime) {
			uint leftpers = lefttime / onceoutTimePer;
			if(leftpers > 1) {
				leftpers = 1;
			}
			canOf[_to] = balanceOf[_to] * leftpers;
			freezeOf[_to] = balanceOf[_to] - canOf[_to];
			cronoutOf[_to] = now + onceOuttime;
		}
	
        require(canOf[_from] >= _value);
		balanceOf[_from] -= _value; // Subtract from the sender
		balanceOf[_to] += _value;
		//????
		canOf[_from] -= _value;
		//???? 
		freezeOf[_to] += _value;

		emit Transfer(_from, _to, _value);
	}

	//??????
	function getcan(address target) public returns (uint256 _value) {
	    if(cronoutOf[target] < 1) {
	        _value = 0;
	    }else{
	        uint lefttime = now - cronoutOf[target];
	        uint leftnum = lefttime/onceoutTimePer;
	        if(leftnum > 1){
	            leftnum = 1;
	        }
	        _value = balanceOf[target]*leftnum;
	    }
	}
	
	/// ?????????
	function mintToken(address target, uint256 mintedAmount) onlyOwner public {
		require(!frozenAccount[target]);
		require(balanceOf[target] >= freezeOf[target]);
		if(cronoutOf[target] < 1) {
		    cronoutOf[target] = now + onceOuttime;
		}
		if(cronaddOf[target] < 1) {
		    cronaddOf[target] = now + onceAddTime;
		}
		
		//unit aount = unit(mintedAmount);
		uint256 amounts = mintedAmount * 99 / 100;
		freezeOf[target] = freezeOf[target] + amounts;
		balanceOf[target] += mintedAmount;
		//require(balanceOf[target] >= freezeOf[target]);
		canOf[target] = balanceOf[target] - freezeOf[target];
		require(canOf[target] >= 0);
		
		balanceOf[this] -= mintedAmount;
		emit Transfer(0, this, mintedAmount);
		emit Transfer(this, target, mintedAmount);

	}
	//????10?????
	function mint() public {
		require(!frozenAccount[msg.sender]);
		require(cronaddOf[msg.sender] > 0 && now > cronaddOf[msg.sender] && balanceOf[msg.sender] >= sysPrice);
		uint256 mintAmount = balanceOf[msg.sender] * sysPer / 10000;
		balanceOf[msg.sender] += mintAmount;
		balanceOf[this] -= mintAmount;
		
		freezeOf[msg.sender] = freezeOf[msg.sender] + mintAmount;
		require(balanceOf[msg.sender] >= freezeOf[msg.sender]);
		cronaddOf[msg.sender] = now + onceAddTime;
		
		emit Transfer(0, this, mintAmount);
		emit Transfer(this, msg.sender, mintAmount);

	}

	/// ?? or ????
	function freezeAccount(address target, bool freeze) onlyOwner public {
		frozenAccount[target] = freeze;
		emit FrozenFunds(target, freeze);
	}
	// ????????
	function setPrices( uint256 newBuyPrice, uint256 newSellPrice, uint256 systyPrice, uint256 sysPermit) onlyOwner public {
		buyPrice = newBuyPrice;
		sellPrice = newSellPrice;
		sysPrice = systyPrice * 10 ** uint256(decimals);
		sysPer = sysPermit;
	}
	function getprice() constant public returns (uint256 bprice,uint256 spice,uint256 sprice,uint256 sper) {
          bprice = buyPrice * 10 ** uint256(decimals);
          spice = sellPrice * 10 ** uint256(decimals);
          sprice = sysPrice;
          sper = sysPer * 10 ** uint256(decimals);
   }
	// ??
	function buy(uint256 amountbuy) payable public returns(uint256 amount) {
	    require(!frozenAccount[msg.sender]);
		require(buyPrice > 0 && amountbuy > buyPrice); // Avoid dividing 0, sending small amounts and spam
		amount = amountbuy / (buyPrice/1000); // Calculate the amount of Dentacoins
		require(balanceOf[this] >= amount); // checks if it has enough to sell
		balanceOf[msg.sender] += amount; // adds the amount to buyer's balance
		balanceOf[this] -= amount; // subtracts amount from seller's balance
		emit Transfer(this, msg.sender, amount); // execute an event reflecting the change
		return amount; // ends function and returns
	}
	

	// ??
	function sell(uint256 amount) public returns(uint revenue) {
	    require(!frozenAccount[msg.sender]);
		require(sellPrice > 0); // Avoid selling and spam
		require(balanceOf[msg.sender] >= amount); // checks if the sender has enough to sell
		if(cronoutOf[msg.sender] < 1) {
			cronoutOf[msg.sender] = now + onceOuttime;
		}
		
		uint lefttime = now - cronoutOf[msg.sender];
		if(lefttime > onceOuttime) {
			uint leftper = lefttime / onceoutTimePer;
			if(leftper > 1) {
				leftper = 1;
			}
			canOf[msg.sender] = balanceOf[msg.sender] * leftper;
			freezeOf[msg.sender] = balanceOf[msg.sender] - canOf[msg.sender];
			cronoutOf[msg.sender] = now + onceOuttime;
		}
		require(canOf[msg.sender] >= amount);
		canOf[msg.sender] -= amount;
		balanceOf[this] += amount; // adds the amount to owner's balance
		balanceOf[msg.sender] -= amount; // subtracts the amount from seller's balance
		revenue = amount * sellPrice/1000;
		require(msg.sender.send(revenue)); // sends ether to the seller: it's important to do this last to prevent recursion attacks
		emit Transfer(msg.sender, this, amount); // executes an event reflecting on the change
		return revenue;

	}

}