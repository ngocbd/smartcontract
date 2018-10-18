/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract lepaitoken at 0xd0839f4032f42f937da73d7d282ededdc4264203
*/
pragma solidity ^ 0.4.25;

/* ??????? ????? */
contract owned {

    address public owner;

    constructor() public {
    owner = msg.sender;
    }
    /* modifier????? */
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    /* ???????? onlyOwner????????????? */
    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }   
}
contract lepaitoken is owned{
    using SafeMath for uint;
    string public symbol;
	string public name;
	uint8 public decimals;
    uint public systemprice;
    struct putusers{
	    	address puser;//???
	    	uint addtime;//????
	    	uint addmoney; //????
	    	string useraddr; //????? 
    }
    struct auctionlist{
        address adduser;//???0
        uint opentime;//????1
        uint endtime;//????2
        uint openprice;//????3
        uint endprice;//????4
        uint onceprice;//????5
        uint currentprice;//????6
        string goodsname; //????7
        string goodspic; //????8 
        bool ifend;//????9
        uint ifsend;//????10
        uint lastid;//???11
        mapping(uint => putusers) aucusers;//???????
        mapping(address => uint) ausers;//????????
    }
    auctionlist[] public auctionlisting; //????
    auctionlist[] public auctionlistend; //?????
    auctionlist[] public auctionlistts; //???? 
    mapping(address => uint[]) userlist;//?????????
    mapping(address => uint[]) mypostauct;//??????????
    mapping(address => uint) balances;
    //?????
	mapping(address => bool) public admins;
    //0x56F527C3F4a24bB2BeBA449FFd766331DA840FFA
    address btycaddress = 0x56F527C3F4a24bB2BeBA449FFd766331DA840FFA;
    btycInterface constant private btyc = btycInterface(0x56F527C3F4a24bB2BeBA449FFd766331DA840FFA);
    /* ?? */
	event auctconfim(address target, uint tokens);//??????
	event getmoneys(address target, uint tokens);//??????
	event Transfer(address indexed from, address indexed to, uint tokens);
	/* modifier????? */
    modifier onlyadmin {
        require(admins[msg.sender] == true);
        _;
    }
	constructor() public {
	    symbol = "BTYClepai";
		name = "BTYC lepai";
		decimals = 18;
	    systemprice = 20000 ether;
	    admins[owner] = true;
	}
	/*???? */
	function addauction(address addusers,uint opentimes, uint endtimes, uint onceprices, uint openprices, uint endprices, string goodsnames, string goodspics) public returns(uint){
	    uint _now = now;
	    require(opentimes >= _now - 1 hours);
	    require(opentimes < _now + 2 days);
	    require(endtimes > opentimes);
	    //require(endtimes > _now + 2 days);
	    require(endtimes < opentimes + 2 days);
	    require(btyc.balanceOf(addusers) >= systemprice);
	    auctionlisting.push(auctionlist(addusers, opentimes, endtimes, openprices, endprices, onceprices, openprices, goodsnames, goodspics, false, 0, 0));
	    uint lastid = auctionlisting.length;
	    mypostauct[addusers].push(lastid);
	    return(lastid);
	}
	//????????
	function getmypostlastid() public view returns(uint){
	    return(mypostauct[msg.sender].length);
	}
	//????????id
	function getmypost(uint ids) public view returns(uint){
	    return(mypostauct[msg.sender][ids]);
	}
	/* ?????? */
	function balanceOf(address tokenOwner) public view returns(uint balance) {
		return balances[tokenOwner];
	}
	//btyc????
	function btycBalanceOf(address addr) public view returns(uint) {
	    return(btyc.balanceOf(addr));
	}
	/* ??????? */
    function _transfer(address _from, address _to, uint _value) private {
        // ?????0x0
        require(_to != 0x0);
        // ?????????????
        require(balances[_from] >= _value);
        // ???????????????
        require(balances[_to] + _value > balances[_to]);
        // ??????????? ??????????
        uint previousBalances = balances[_from] + balances[_to];
        // ???????
        balances[_from] -= _value;
        // ????????
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        // ????? ?????
        assert(balances[_from] + balances[_to] == previousBalances);
    }
    function transfer(address _to, uint256 _value) public returns(bool){
        _transfer(msg.sender, _to, _value);
    }
    function transferadmin(address _from, address _to, uint _value)  public onlyadmin{
        _transfer(_from, _to, _value);
    }
    function transferto(uint256 _value) public returns(bool){
        _transfer(msg.sender, this, _value);
    }
	function() payable public {
	    address to = msg.sender;
		balances[to] = balances[to].add(msg.value);
		emit Transfer(msg.sender, this, msg.value);
	}
	//??????
	function canuse(address addr) public view returns(uint) {
	    return(btyc.getcanuse(addr));
	}
	//??????
	function btycownerof() public view returns(uint) {
	    return(btyc.balanceOf(this));
	}
	function ownerof() public view returns(uint) {
	    return(balances[this]);
	}
	//???????
	function sendleftmoney(address _to, uint _value) public onlyadmin{
	     _transfer(this, _to, _value);
	}
	/*????*/
	function inputauction(uint auctids, address pusers, uint addmoneys,string useraddrs) public payable{
	    uint _now = now;
	    auctionlist storage c = auctionlisting[auctids];
	    require(c.ifend == false);
	    require(c.ifsend == 0);
	    
	    uint userbalance = balances[pusers];
	    require(addmoneys > c.currentprice);
	    require(addmoneys <= c.endprice);
	   // uint userhasmoney = c.ausers[pusers];
	   require(addmoneys > c.ausers[pusers]);
	    uint money = addmoneys - c.ausers[pusers];
	    
	    require(userbalance >= money);
	    if(c.endtime < _now) {
	        c.ifend = true;
	    }else{
	        if(addmoneys == c.endprice){
	            c.ifend = true;
	        }
	        transferto(money);
	        c.ausers[pusers] = addmoneys;
	        c.currentprice = addmoneys;
	        c.aucusers[c.lastid++] = putusers(pusers, _now, addmoneys,  useraddrs);
	    
	        userlist[pusers].push(auctids);
	        //emit auctconfim(pusers, money);
	    }
	    
	    
	    //}
	    
	}
	//???????????
	function getuserlistlength(address uaddr) public view returns(uint len) {
	    len = userlist[uaddr].length;
	}
	//??????
	function viewauction(uint aid) public view returns(address addusers,uint opentimes, uint endtimes, uint onceprices, uint openprices, uint endprices, uint currentprices, string goodsnames, string goodspics, bool ifends, uint ifsends, uint anum){
		auctionlist storage c = auctionlisting[aid];
		addusers = c.adduser;//0
		opentimes = c.opentime;//1
		endtimes = c.endtime;//2
		onceprices = c.onceprice;//3
		openprices = c.openprice;//4
		endprices = c.endprice;//5
		currentprices = c.currentprice;//6
		goodspics = c.goodspic;//7
		goodsnames = c.goodsname;//8
		ifends = c.ifend;//9
		ifsends = c.ifsend;//10
		anum = c.lastid;//11
		
	}
	//????????????
	function viewauctionlist(uint aid, uint uid) public view returns(address pusers,uint addtimes,uint addmoneys){
	    auctionlist storage c = auctionlisting[aid];
	    putusers storage u = c.aucusers[uid];
	    pusers = u.puser;//0
	    addtimes = u.addtime;//1
	    addmoneys = u.addmoney;//2
	}
	//???????????
	function getactlen() public view returns(uint) {
	    return(auctionlisting.length);
	}
	//?????????
	function getacttslen() public view returns(uint) {
	    return(auctionlistts.length);
	}
	//?????????
	function getactendlen() public view returns(uint) {
	    return(auctionlistend.length);
	}
	//???????
	function setsendgoods(uint auctids) public {
	    uint _now = now;
	     auctionlist storage c = auctionlisting[auctids];
	     require(c.adduser == msg.sender);
	     require(c.endtime < _now);
	     require(c.ifsend == 0);
	     c.ifsend = 1;
	     c.ifend = true;
	}
	//??????????
	function setgetgoods(uint auctids) public {
	    uint _now = now;
	    auctionlist storage c = auctionlisting[auctids];
	    require(c.endtime < _now);
	    require(c.ifend == true);
	    require(c.ifsend == 1);
	    putusers storage lasttuser = c.aucusers[c.lastid];
	    require(lasttuser.puser == msg.sender);
	    c.ifsend = 2;
	    uint getmoney = lasttuser.addmoney*70/100;
	    btyc.mintToken(c.adduser, getmoney);
	    auctionlistend.push(c);
	}
	//??????????????
	function getuseraddress(uint auctids) public view returns(string){
	    auctionlist storage c = auctionlisting[auctids];
	    require(c.adduser == msg.sender);
	    //putusers memory mdata = c.aucusers[c.lastid];
	    return(c.aucusers[c.lastid].useraddr);
	}
	function editusetaddress(uint aid, string setaddr) public returns(bool){
	    auctionlist storage c = auctionlisting[aid];
	    putusers storage data = c.aucusers[c.lastid];
	    require(data.puser == msg.sender);
	    data.useraddr = setaddr;
	    return(true);
	}
	/*?????????????????? */
	function endauction(uint auctids) public {
	    //uint _now = now;
	    auctionlist storage c = auctionlisting[auctids];
	    require(c.ifsend == 2);
	    uint len = c.lastid;
	    putusers storage firstuser = c.aucusers[0];
        address suser = msg.sender;
	    
	    require(c.ifend == true);
	    require(len > 1);
	    require(c.ausers[suser] > 0);
	    uint sendmoney = 0;
	    if(len == 2) {
	        require(firstuser.puser == suser);
	        sendmoney = c.currentprice*3/10 + c.ausers[suser];
	    }else{
	        if(firstuser.puser == suser) {
	            sendmoney = c.currentprice*1/10 + c.ausers[suser];
	        }else{
	            uint onemoney = (c.currentprice*2/10)/(len-2);
	            sendmoney = onemoney + c.ausers[suser];
	        }
	    }
	    require(sendmoney > 0);
	    c.ausers[suser] = 0;
	    btyc.mintToken(suser, sendmoney);
	    emit getmoneys(suser, sendmoney);
	    
	}
	//???????
	function setsystemprice(uint price) public onlyadmin{
	    systemprice = price;
	}
	//???????????
	function setauctionother(uint auctids) public onlyadmin{
	    auctionlist storage c = auctionlisting[auctids];
	    btyc.freezeAccount(c.adduser, true);
	    c.ifend = true;
	    c.ifsend = 3;
	}
	//??????
	function setauctionsystem(uint auctids, uint setnum) public onlyadmin{
	    auctionlist storage c = auctionlisting[auctids]; 
	    c.ifend = true;
	    c.ifsend = setnum;
	}
	
	//??????
	function setauctionotherfree(uint auctids) public onlyadmin{
	    auctionlist storage c = auctionlisting[auctids];
	    btyc.freezeAccount(c.adduser, false);
	    c.ifsend = 2;
	}
	//?????????????
	function tsauction(uint auctids) public{
	   auctionlist storage c = auctionlisting[auctids];
	   uint _now = now;
	   require(c.endtime > _now);
	   require(c.endtime + 2 days < _now);
	   require(c.aucusers[c.lastid].puser == msg.sender);
	   if(c.endtime + 2 days < _now && c.ifsend == 0) {
	       c.ifsend = 5;
	       c.ifend = true;
	       auctionlistts.push(c);
	   }
	   if(c.endtime + 9 days < _now && c.ifsend == 1) {
	       c.ifsend = 5;
	       c.ifend = true;
	       auctionlistts.push(c);
	   }
	}
	//??????????????
	function endauctionother(uint auctids) public {
	    //uint _now = now;
	    auctionlist storage c = auctionlisting[auctids];
	    address suser = msg.sender;
	    require(c.ifsend == 3);
	    require(c.ausers[suser] > 0);
	    btyc.mintToken(suser,c.ausers[suser]);
	    c.ausers[suser] = 0;
	    emit getmoneys(suser, c.ausers[suser]);
	}
	/*
	 * ?????
	 * @param {Object} address
	 */
	function admAccount(address target, bool freeze) onlyOwner public {
		admins[target] = freeze;
	}
	
}
//btyc???
interface btycInterface {
    function balanceOf(address _addr) external view returns (uint256);
    function mintToken(address target, uint256 mintedAmount) external returns (bool);
    //function transfer(address to, uint tokens) external returns (bool);
    function freezeAccount(address target, bool freeze) external returns (bool);
    function getcanuse(address tokenOwner) external view returns(uint);
    //function getprice() external view returns(uint addtime, uint outtime, uint bprice, uint spice, uint sprice, uint sper, uint givefrom, uint giveto, uint giveper, uint sdfrozen, uint sdper1, uint sdper2, uint sdper3);
}
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