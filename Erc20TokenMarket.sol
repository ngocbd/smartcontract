/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Erc20TokenMarket at 0xeffde26234cab40b54af9e28268912da42c1c975
*/
// This is ERC 2.0 Token's Trading Market, Decentralized Exchange Contract. ????ERC20Token???????????
// ?????????????ERC20???Token????????????????
// by he.guanjun, email: he.d.d.shan@hotmail.com
// 2017-09-28 update
// TODO?
//  1,???function????????????????????????????
//  2,Token????????????owner????????????
// ???????????????function????????????????????function???????????The DAO????????????????????????function??????????
// ?????????????????????????????????msg.sender,tx.origin??????????????????????????


pragma solidity ^0.4.11; 

// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/issues/20
interface Erc20Token {
      function totalSupply() constant returns (uint256 totalSupply);
      function balanceOf(address _owner) constant returns (uint256 balance);

      function transfer(address _to, uint256 _value) returns (bool success);

      function allowance(address _owner, address _spender) constant returns (uint256 remaining);
      function approve(address _spender, uint256 _value) returns (bool success);
      function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

      event Transfer(address indexed _from, address indexed _to, uint256 _value);
      event Approval(address indexed _owner, address indexed _spender, uint256 _value);

      function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success);
}

contract Base { 
    uint createTime = now;

    address public owner;
    
    function Base() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function transferOwnership(address _newOwner)  public  onlyOwner {
        owner = _newOwner;
    }

    mapping (address => uint256) public userEtherOf;   

    function userRefund() public   {
        //require(msg.sender == tx.origin);     //TODO?
         _userRefund(msg.sender, msg.sender);
    }

    function userRefundTo(address _to) public   {
        //require(msg.sender == tx.origin);     //TODO?
        _userRefund(msg.sender, _to);
    }

    function _userRefund(address _from,  address _to) private {
        require (_to != 0x0);  
        lock();
        uint256 amount = userEtherOf[_from];
        if(amount > 0){
            userEtherOf[_from] -= amount;
            _to.transfer(amount);               //???????????????Token?????????? 2017-09-27
        }
        unLock();
    }

    bool public globalLocked = false;      //????????????????? 2017-10-02

    function lock() internal {              //? lock ? unLock ????????? require ?????????????? lock ???????
        require(!globalLocked);
        globalLocked = true;
    }

    function unLock() internal {
        require(globalLocked);
        globalLocked = false;
    }    

    //event OnSetLock(bool indexed _oldGlobalLocked, bool indexed _newGlobalLocked);

    function setLock()  public onlyOwner{       //sometime, globalLocked always is true???
        //bool _oldGlobalLocked = globalLocked;
        globalLocked = false;     
        //OnSetLock(_oldGlobalLocked, false);   
    }
}

//?? interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }
contract  Erc20TokenMarket is Base         //for exchange token
{
    function Erc20TokenMarket()  Base ()  {
    }

    mapping (address => uint) public badTokenOf;      //Token ????

    event OnBadTokenChanged(address indexed _tokenAddress, uint indexed _badNum);

    function addBadToken(address _tokenAddress) public onlyOwner{
        badTokenOf[_tokenAddress] += 1;
        OnBadTokenChanged(_tokenAddress, badTokenOf[_tokenAddress]);
    }

    function removeBadToken(address _tokenAddress) public onlyOwner{
        badTokenOf[_tokenAddress] = 0;
        OnBadTokenChanged(_tokenAddress, badTokenOf[_tokenAddress]);
    }

    function isBadToken(address _tokenAddress) private returns(bool _result) {
        return badTokenOf[_tokenAddress] > 0;        
    }

    uint256 public sellerGuaranteeEther = 0 ether;      //???????????

    function setSellerGuarantee(uint256 _gurateeEther) public onlyOwner {
        require(now - createTime > 1 years);        //???????????
        require(_gurateeEther <= 0.1 ether);        //????????????????????
        sellerGuaranteeEther = _gurateeEther;        
    }    

    function checkSellerGuarantee(address _seller) private returns (bool _result){
        return userEtherOf[_seller] >= sellerGuaranteeEther;            //??????????????????????????????
    }

    function userRefundWithoutGuaranteeEther() public   {       //??????????
        lock();

        if (userEtherOf[msg.sender] > 0 && userEtherOf[msg.sender] >= sellerGuaranteeEther){
            uint256 amount = userEtherOf[msg.sender] - sellerGuaranteeEther;
            userEtherOf[msg.sender] -= amount;
            msg.sender.transfer(amount);            //?????? 2017-09-28
        }

        unLock();
    }

    struct SellingToken{                //TokenInfo???????????????????????????????????????????? TODO?
        uint256    thisAmount;          //currentAmount?????????????,??? this ??????
        uint256    soldoutAmount;       //?????????????????????????????? 2017-09-27
        uint256    price;      
        bool       cancel;              //?????????
        uint       lineTime;            //??????
    }    

    mapping (address => mapping(address => SellingToken)) public userSellingTokenOf;    //?????????????

    //event OnReceiveApproval(address indexed _tokenAddress, address _seller, uint indexed _sellingAmount, uint256 indexed _price, uint _lineTime, bool _cancel);
    event OnSetSellingToken(address indexed _tokenAddress, address _seller, uint indexed _sellingAmount, uint256 indexed _price, uint _lineTime, bool _cancel);
    //event OnCancelSellingToken(address indexed _tokenAddress, address _seller, uint indexed _sellingAmount, uint256 indexed _price, uint _lineTime, bool _cancel);

    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public {
        _extraData;
        _value;
        require(_from != 0x0);
        require(_token != 0x0);
        //require(_value > 0);              //no
        require(_token == msg.sender && msg.sender != tx.origin);   //????????????????????????????????????
        require(!isBadToken(msg.sender));                           //???????????????

        lock();

        Erc20Token token = Erc20Token(msg.sender);
        var sellingAmount = token.allowance(_from, this);   //_from == tx.origin != msg.sender = _token , _from == tx.origin ????????????????????

        //var sa = token.balanceOf(_from);        //?????????Token???????Token???????????????????????????
        //if (sa < sellingAmount){
        //    sellingAmount = sa;
        //}

        //require(sellingAmount > 0);       //no 

        var st = userSellingTokenOf[_from][_token];                 //??(??)??? Token???
        st.thisAmount = sellingAmount;
        //st.price = 0;
        //st.lineTime = 0;
        //st.cancel = true;      
        OnSetSellingToken(_token, _from, sellingAmount, st.price, st.lineTime, st.cancel);
        unLock();
    }
      
    function setSellingToken(address _tokenAddress,  uint256 _price, uint _lineTime) public returns(uint256  _sellingAmount) {
        require(_tokenAddress != 0x0);
        require(_price > 0);
        require(_lineTime > now);
        require(!isBadToken(_tokenAddress));                //???
        require(checkSellerGuarantee(msg.sender));          //????
        lock();

        Erc20Token token = Erc20Token(_tokenAddress);
        _sellingAmount = token.allowance(msg.sender,this);      //??????? 2017-09-27

        //var sa = token.balanceOf(_from);        //?????????Token
        //if (sa < _sellingAmount){
        //    _sellingAmount = sa;
        //}

        var st = userSellingTokenOf[msg.sender][_tokenAddress];
        st.thisAmount = _sellingAmount;
        st.price = _price;
        st.lineTime = _lineTime;
        st.cancel = false;

        OnSetSellingToken(_tokenAddress, msg.sender, _sellingAmount, _price, _lineTime, st.cancel);
        unLock();
    }   

    function cancelSellingToken(address _tokenAddress)  public{     // returns(bool _result) delete , 2017-09-27
        require(_tokenAddress != 0x0);    
        
        lock();

        var st = userSellingTokenOf[msg.sender][_tokenAddress];
        st.cancel = true;
        
        Erc20Token token = Erc20Token(_tokenAddress);
        var sellingAmount = token.allowance(msg.sender,this);   //??????? 2017-09-27
        st.thisAmount = sellingAmount;
        
        OnSetSellingToken(_tokenAddress, msg.sender, sellingAmount, st.price, st.lineTime, st.cancel);

        unLock();
    }    

    event OnBuyToken(address _buyer, uint _buyerRamianEtherAmount, address indexed _seller, address indexed _tokenAddress, uint256  _transTokenAmount, uint256 indexed _tokenPrice, uint256 _sellerRamianTokenAmount);
    //event OnBuyToken(address _buyer, address indexed _seller, address indexed _tokenAddress, uint256  _transTokenAmount, uint256 indexed _tokenPrice, uint256 _sellerRamianTokenAmount);

    function buyTokenFrom(address _seller, address _tokenAddress, uint256 _buyerTokenPrice) public payable returns(bool _result) {   
        require(_seller != 0x0);
        require(_tokenAddress != 0x0);
        require(_buyerTokenPrice > 0);

        lock();              //??  //???????   //?????????????????????????????????????? 2017-09-27
        
        _result = false;

        userEtherOf[msg.sender] += msg.value;
        if (userEtherOf[msg.sender] == 0){
            unLock();
            return; 
        }

        Erc20Token token = Erc20Token(_tokenAddress);
        var sellingAmount = token.allowance(_seller, this);     //??? _spender   
        var st = userSellingTokenOf[_seller][_tokenAddress];    //???Token

        var sa = token.balanceOf(_seller);        //?????????Token???????Token??????????????????
        bool bigger = false;
        if (sa < sellingAmount){                  //???????????????????????????owner ? ???????
            sellingAmount = sa;
            bigger = true;
        }

        if (st.price > 0 && st.lineTime > now && sellingAmount > 0 && !st.cancel){
            if(_buyerTokenPrice < st.price){                                                //price maybe be changed!
                OnBuyToken(msg.sender, userEtherOf[msg.sender], _seller, _tokenAddress, 0, st.price, sellingAmount);
                unLock();
                return;
            }

            uint256 canTokenAmount =  userEtherOf[msg.sender]  / st.price;      
            if(canTokenAmount > 0 && canTokenAmount *  st.price >  userEtherOf[msg.sender]){
                 canTokenAmount -= 1;
            }
            if(canTokenAmount == 0){
                OnBuyToken(msg.sender, userEtherOf[msg.sender], _seller, _tokenAddress, 0, st.price, sellingAmount);
                unLock();
                return;
            }
            if (canTokenAmount > sellingAmount){
                canTokenAmount = sellingAmount; 
            }
            
            var etherAmount =  canTokenAmount *  st.price;      //?????????? canTokenAmount =  userEtherOf[msg.sender]  / st.price;      2017-09-27
            userEtherOf[msg.sender] -= etherAmount;                     //??????
            //require(userEtherOf[msg.sender] >= 0);                      //????: ???uint?????2017-09-27 delete

            token.transferFrom(_seller, msg.sender, canTokenAmount);    //???, ????? the dao ?????       
            if(userEtherOf[_seller]  >= sellerGuaranteeEther){          //????????????????????????            
                _seller.transfer(etherAmount);                          //????????? the dao ?????      
            }   
            else{                                                       //???????
                userEtherOf[_seller] +=  etherAmount;                   //?????????? //????????2017-09-27
            }      
            st.soldoutAmount += canTokenAmount;                         //?????     //???????????????????????????????? 2017-09-27
            st.thisAmount = token.allowance(_seller, this);             //?????????

            OnBuyToken(msg.sender, userEtherOf[msg.sender], _seller, _tokenAddress, canTokenAmount, st.price, st.thisAmount);     
            _result = true;
        }
        else{
            _result = false;
            OnBuyToken(msg.sender, userEtherOf[msg.sender], _seller, _tokenAddress, 0, st.price, sellingAmount);
        }

        if (bigger && sellerGuaranteeEther > 0){                                  //?????Token??????????????????????
            var pf = sellerGuaranteeEther;
            if (pf > userEtherOf[_seller]){
                pf = userEtherOf[_seller];
            }
            if(pf > 0){
                userEtherOf[owner] +=  pf / 2;           
                userEtherOf[msg.sender] +=   pf - pf / 2;
                userEtherOf[_seller] -= pf;
            }
        }
        
        unLock();
        return;
    }

    function () public payable {
        if(msg.value > 0){          //????????????????
            userEtherOf[msg.sender] += msg.value;
        }
    }

    function disToken(address _token) public {          //???????Token????????????? this ??? token ??????Owner??????????????????????????????
        lock();

        Erc20Token token = Erc20Token(_token);  //????? ERC20 Token??????Token???????
        var amount = token.balanceOf(this);     //??????2017-09-27
        if (amount > 0){
            var a1 = amount / 2;
            if (a1 > 0){
                token.transfer(msg.sender, a1); //??????2017-09-27
            }
            var a2 = amount - a1;
            if (a2 > 0){
                token.transfer(owner, a2);      //??????2017-09-27
            }
        }

        unLock();
    }
}