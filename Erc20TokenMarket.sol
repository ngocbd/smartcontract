/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Erc20TokenMarket at 0x754614fea204097fd934dc26784d837bc884b00d
*/
// This is ERC 2.0 Token's Trading Market, Decentralized Exchange. 
// by he.guanjun, email: he.d.d.shan@hotmail.com
// 2017-09-27
// TODO?
//  1,???function????????????????????????????
//  2,Token????????????owner????????????


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
         _userRefund(msg.sender, msg.sender);
    }

    function userRefundTo(address _to) public   {
        _userRefund(msg.sender, _to);
    }

    function _userRefund(address _from,  address _to) private {
        require (_to != 0x0);  
        uint256 amount = userEtherOf[_from];
        if(amount > 0){
            userEtherOf[_from] -= amount;
            _to.transfer(amount);               //???????????????Token?????????? 2017-09-27
        }
    }

}

//?? interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }
contract  Erc20TokenMarket is Base         //for exchange token
{
    function Erc20TokenMarket()  Base ()  {
    }

    mapping (address => uint) public BadTokenOf;      //Token ????

    function addBadToken(address _tokenAddress) public onlyOwner{
        BadTokenOf[_tokenAddress] += 1;
    }

    function removeBadToken(address _tokenAddress) public onlyOwner{
        BadTokenOf[_tokenAddress] = 0;
    }

    function isBadToken(address _tokenAddress) private returns(bool _result) {
        return BadTokenOf[_tokenAddress] > 0;        
    }

    bool public hasSellerGuarantee = false;
    
    uint256 public sellerGuaranteeEther = 0 ether;      //???????????

    function setSellerGuarantee(bool _has, uint256 _gurateeEther) public onlyOwner {
        require(now - createTime > 1 years);    //???????????
        require(_gurateeEther < 0.1 ether);     //????????????????????
        hasSellerGuarantee = _has;
        sellerGuaranteeEther = _gurateeEther;        
    }    

    function checkSellerGuarantee(address _seller) private returns (bool _result){
        if (hasSellerGuarantee){
            return userEtherOf[_seller] >= sellerGuaranteeEther;            //??????????????????????????????
        }
        return true;
    }

    function userRefundWithoutGuaranteeEther() public   {       //??????????
        if (userEtherOf[msg.sender] >= sellerGuaranteeEther){
            uint256 amount = userEtherOf[msg.sender] - sellerGuaranteeEther;
            userEtherOf[msg.sender] -= amount;
            msg.sender.transfer(amount); 
        }
    }

    struct SellingToken{                //TokenInfo???????????????????????????????????????????? TODO?
        uint256    thisAmount;          //currentAmount?????????????,??? this ??????
        uint256    soldoutAmount;       //?????????????????????????????? 2017-09-27
        uint256    price;      
        bool       cancel;              //?????????
        uint       lineTime;            //??????
    }    

    mapping (address => mapping(address => SellingToken)) public userSellingTokenOf;    //?????????????

    event OnSetSellingToken(address indexed _tokenAddress, address _seller, uint indexed _sellingAmount, uint256 indexed _price, uint _lineTime, bool _cancel);

    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public {
        _extraData;
        _value;
        require(_from != 0x0);
        require(_token != 0x0);
        //require(_value > 0);              //no
        require(_token == msg.sender && msg.sender != tx.origin);   //????????????????????????????????????
        require(!isBadToken(msg.sender));                           //???????????????

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
    }
      
    function setSellingToken(address _tokenAddress,  uint256 _price, uint _lineTime) public returns(uint256  _sellingAmount) {
        require(_tokenAddress != 0x0);
        require(_price > 0);
        require(_lineTime > now);
        require(!isBadToken(msg.sender));              //???
        require(checkSellerGuarantee(msg.sender));     //????

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
    }   

    function cancelSellingToken(address _tokenAddress)  public{ // returns(bool _result) delete , 2017-09-27
        require(_tokenAddress != 0x0);    
        //_result = false;       

        var st = userSellingTokenOf[msg.sender][_tokenAddress];
        st.cancel = true;
        
        Erc20Token token = Erc20Token(_tokenAddress);
        var sellingAmount = token.allowance(msg.sender,this);   //??????? 2017-09-27
        st.thisAmount = sellingAmount;
        
        OnSetSellingToken(_tokenAddress, msg.sender, sellingAmount, st.price, st.lineTime, st.cancel);
    }    

    event OnBuyToken(uint __ramianBuyerEtherAmount, address _buyer, address indexed _seller, address indexed _tokenAddress, uint256  _transAmount, uint256 indexed _tokenPrice, uint256 _ramianTokenAmount);

    bool public _isBuying = false;              //lock 

    function setIsBuying()  public onlyOwner{   //sometime, _isBuying always is true???
        _isBuying = false;        
    }

    function buyTokenFrom(address _seller, address _tokenAddress, uint256 _buyerTokenPrice) public payable returns(bool _result) {   
        require(_seller != 0x0);
        require(_tokenAddress != 0x0);
        require(_buyerTokenPrice > 0);

        require(!_isBuying);            //???????   //?????????????????????????????????????? 2017-09-27
        _isBuying = true;               //??

        userEtherOf[msg.sender] += msg.value;
        if (userEtherOf[msg.sender] == 0){
            _isBuying = false;
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
                OnBuyToken(userEtherOf[msg.sender], msg.sender, _seller, _tokenAddress, 0, _buyerTokenPrice, sellingAmount);
                _result = false;
                _isBuying = false;
                return;
            }

            uint256 canTokenAmount =  userEtherOf[msg.sender]  / st.price;      
            if(canTokenAmount > 0 && canTokenAmount *  st.price >  userEtherOf[msg.sender]){
                 canTokenAmount -= 1;
            }
            if(canTokenAmount == 0){
                OnBuyToken(userEtherOf[msg.sender], msg.sender, _seller, _tokenAddress, 0, st.price, sellingAmount);
                _result = false;
                _isBuying = false;
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

            OnBuyToken(userEtherOf[msg.sender], msg.sender, _seller, _tokenAddress, canTokenAmount, st.price, st.thisAmount);     
            _result = true;
        }
        else{
            _result = false;
            OnBuyToken(userEtherOf[msg.sender], msg.sender, _seller, _tokenAddress, 0, _buyerTokenPrice, sellingAmount);
        }

        if (bigger && sellerGuaranteeEther > 0){                                  //?????Token??????
            if(checkSellerGuarantee(_seller)) {          //?????Token???????????, owner ? buyer ?????????????????
                userEtherOf[owner] +=  sellerGuaranteeEther / 2; 
                userEtherOf[msg.sender] +=   sellerGuaranteeEther - sellerGuaranteeEther / 2;   //?????2??????  2017-09-27
                userEtherOf[_seller] -= sellerGuaranteeEther;
            }
            else if (userEtherOf[_seller] > 0)     //Buyer???????????????????????????????????????????????????????????gas??,???????0.1 ether??????
            {
                userEtherOf[owner] +=  userEtherOf[_seller] / 2; 
                userEtherOf[msg.sender] +=   userEtherOf[_seller] - userEtherOf[_seller] / 2;
                userEtherOf[_seller] = 0;
            }
        }
        
        _isBuying = false;          //??
        return;
    }

    function () public payable {
        if(msg.value > 0){          //????????????????
            userEtherOf[msg.sender] += msg.value;
        }
    }

    bool private isDisTokening = false;     //add 2017-09-27

    function disToken(address _token) public {          //???????Token????????????? this ??? token ??????Owner??????????????????????????????
        require(!isDisTokening);            //??????? 2017-09-27
        isDisTokening = true;               //?? 2017-09-27

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
        isDisTokening = false;
    }

}