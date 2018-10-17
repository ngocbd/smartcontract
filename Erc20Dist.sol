/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Erc20Dist at 0xae3e4e45121ecb11b1b534ff5f2b691b741c03ed
*/
pragma solidity ^0.4.11;


contract SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
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
    function min(uint256 x, uint256 y) constant internal returns (uint256 z) {
        return x <= y ? x : y;
    }
}

// contract ERC20 {
//     function totalSupply() constant returns (uint supply);
//     function balanceOf( address who ) constant returns (uint value);
//     function allowance( address owner, address spender ) constant returns (uint _allowance);

//     function transfer( address to, uint value) returns (bool ok);
//     function transferFrom( address from, address to, uint value) returns (bool ok);
//     function approve( address spender, uint value ) returns (bool ok);

//     event Transfer( address indexed from, address indexed to, uint value);
//     event Approval( address indexed owner, address indexed spender, uint value);
// }

//https://github.com/ethereum/ethereum-org/blob/master/solidity/token-erc20.sol
interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }
contract TokenERC20 {
    // Public variables of the token
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
    uint256 public totalSupply;

    // This creates an array with all balances
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    // This generates a public event on the blockchain that will notify clients
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // This notifies clients about the amount burnt
    event Burn(address indexed from, uint256 value);

    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
    }

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * Set allowance for other address and notify
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf, and then ping the contract about it
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     * @param _extraData some extra information to send to the approved contract
     */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
}

contract Erc20Dist is SafeMath {
    TokenERC20  public  _erc20token; //????erc20??

    address public _ownerDist;// ????????????????????????
    uint256 public _distDay;//????
    uint256 public _mode = 0;//???1??????1?2??????2
    uint256 public _lockAllAmount;//?????

    struct Detail{//???????????
        address founder;//?????
        uint256 lockDay;//????
        uint256 lockPercent;//???????0?100???
        uint256 distAmount;//?????
        uint256 lockAmount;//???????
        uint256 initAmount;//???????
        uint256 distRate;//????????????????????????0?100???
        uint256 oneDayTransferAmount;//???????????????
        uint256 transferedAmount;//???????
        uint256 lastTransferDay;//???????????
        bool isFinish;// ?????????
        bool isCancelDist;//????????
    }
    Detail private detail = Detail(address(0),0,0,0,0,0,0,0,0,0, false, false);//????????????????????????????_details
    Detail[] public _details;//????????,???????
	uint256 public _detailsLength = 0;//??????

    bool public _fDist = false;// ????????????
    bool public _fConfig = false;// ????????????
    bool public _fFinish = false;// ??????????
    bool public _fCancelDist = false;// ??????
    
    function Erc20Dist() public {
        _ownerDist = msg.sender; // ???????????
    }

    function () public{}//callback?????????eth???????????????

    // ???????
    function setOwner(address owner_) public {
        require (msg.sender == _ownerDist, "you must _ownerDist");// ?????????
        require(_fDist == false, "not dist"); // ????????
        require(_fConfig == false, "not config");// ???????
        _ownerDist = owner_;
    }
    //????????
    function setErc20(TokenERC20  erc20Token) public {
        require (msg.sender == _ownerDist, "you must _ownerDist");
        require(address(_erc20token) == address(0),"you have set erc20Token");//?????????
        require(erc20Token.balanceOf(address(this)) > 0, "this contract must own tokens");
        _erc20token = erc20Token;//?????erc20??
        _lockAllAmount = erc20Token.balanceOf(address(this));
    }

    // ?????????????????????
    function cancelDist() public {
        require(_fDist == true, "must dist"); // ????
        require(_fCancelDist == false, "must not cancel dist");

        // ??????
        for(uint256 i=0;i<_details.length;i++){
            // ???????
            if ( _details[i].founder == msg.sender ) {
                // ????
                _details[i].isCancelDist = true;
                break;
            }
        }
        // ????
        updateCancelDistFlag();
        if (_fCancelDist == true) {
            require(_erc20token.balanceOf(address(this)) > 0, "must have balance");
            // ????????????
            _erc20token.transfer(
                _ownerDist, 
                _erc20token.balanceOf(address(this))
            );
        }
    }

    // ??????????
    function updateCancelDistFlag() private {
        bool allCancelDist = true;
        for(uint256 i=0; i<_details.length; i++){
            // ?????????
            if (_details[i].isCancelDist == false) {
                allCancelDist = false;
                break;
            }
        }
        // ????????
        _fCancelDist = allCancelDist;
    }

    // ???????????????????????????????
    function clearConfig() public {
        require (msg.sender == _ownerDist, "you must _ownerDist");
        require(_fDist == false, "not dist"); // ????????
        require(address(_erc20token) != address(0),"you must set erc20Token");//???????
        require(_erc20token.balanceOf(address(this)) > 0, "must have balance");
        // ????????????
        _erc20token.transfer(
            msg.sender, 
            _erc20token.balanceOf(address(this))
        );
        // ????
        _lockAllAmount = 0;
        TokenERC20  nullErc20token;
        _erc20token = nullErc20token;
        Detail[] nullDetails;
        _details = nullDetails;
        _detailsLength = 0;
        _mode = 0;
        _fConfig = false;
    }

    // ????????????????????????????????????????????
    function withDraw() public {
        require (msg.sender == _ownerDist, "you must _ownerDist");
        require(_fFinish == true, "dist must be finished"); // ????????
        require(address(_erc20token) != address(0),"you must set erc20Token");//???????
        require(_erc20token.balanceOf(address(this)) > 0, "must have balance");
        // ????????????
        _erc20token.transfer(
            _ownerDist, 
            _erc20token.balanceOf(address(this))
        );
    }

    //??????????????????????????auth??????????????????
    function configContract(uint256 mode,address[] founders,uint256[] distWad18Amounts,uint256[] lockPercents,uint256[] lockDays,uint256[] distRates) public {
    //???????founders??????????
    //distWad18Amounts????????????18???????
    //lockPercents???????????0?100?????
    //lockDays????????,distRates?????????????????????0?10000????
        require (msg.sender == _ownerDist, "you must _ownerDist");
        require(mode==1||mode==2,"there is only mode 1 or 2");//????1?2????????
        _mode = mode;//??????????
        require(_fConfig == false,"you have configured it already");//???????
        require(address(_erc20token) != address(0), "you must setErc20 first");//??????????erc20??
        require(founders.length!=0,"array length can not be zero");//?????????
        require(founders.length==distWad18Amounts.length,"founders length dismatch distWad18Amounts length");//???????????????????
        require(distWad18Amounts.length==lockPercents.length,"distWad18Amounts length dismatch lockPercents length");//?????????????????????
        require(lockPercents.length==lockDays.length,"lockPercents length dismatch lockDays length");//?????????????????????
        require(lockDays.length==distRates.length,"lockDays length dismatch distRates length");//???????????????????????

        //??
        for(uint256 i=0;i<founders.length;i++){
            require(distWad18Amounts[i]!=0,"dist token amount can not be zero");//????????0
            for(uint256 j=0;j<i;j++){
                require(founders[i]!=founders[j],"you could not give the same address of founders");//???????????????
            }
        }
        

        //???????????????????
        uint256 totalAmount = 0;//??????
        uint256 distAmount = 0;//?????????????18????
        uint256 oneDayTransferAmount = 0;//?????????????????????
        uint256 lockAmount = 0;//???????????
        uint256 initAmount = 0;//???????????

        //??
        for(uint256 k=0;k<lockPercents.length;k++){
            require(lockPercents[k]<=100,"lockPercents unit must <= 100");//????????????100
            require(distRates[k]<=10000,"distRates unit must <= 10000");//????????????10000
            distAmount = mul(distWad18Amounts[k],10**18);//?????????????18????
            totalAmount = add(totalAmount,distAmount);//??????
            lockAmount = div(mul(lockPercents[k],distAmount),100);//???????
            initAmount = sub(distAmount, lockAmount);//????????
            oneDayTransferAmount = div(mul(distRates[k],lockAmount),10000);//???????????

            //???????detail?9?????
            detail.founder = founders[k];
            detail.lockDay = lockDays[k];
            detail.lockPercent = lockPercents[k];
            detail.distRate = distRates[k];
            detail.distAmount = distAmount;
            detail.lockAmount = lockAmount;
            detail.initAmount = initAmount;
            detail.oneDayTransferAmount = oneDayTransferAmount;
            detail.transferedAmount = 0;//?????????????????0
            detail.lastTransferDay = 0;//?????????????????0
            detail.isFinish = false;
            detail.isCancelDist = false;
            //????????????????_details
            _details.push(detail);
        }
        require(totalAmount <= _lockAllAmount, "distributed total amount should be equal lock amount");// ????????????
        require(totalAmount <= _erc20token.totalSupply(),"distributed total amount should be less than token totalSupply");//???????????????
		_detailsLength = _details.length;
        _fConfig = true;//????????????????
        _fFinish = false;// ???????
        _fCancelDist = false;// ??????
    }

    //?????????????????????????????0????????????????????auth??????????????????
    function startDistribute() public {
        require (msg.sender == _ownerDist, "you must _ownerDist");
        require(_fDist == false,"you have distributed erc20token already");//?????????
        require(_details.length != 0,"you have not configured");//???????
        _distDay = today();//?????????????????
        uint256 initDistAmount=0;//?????????????“???????”????

        for(uint256 i=0;i<_details.length;i++){
            initDistAmount = _details[i].initAmount;//???

            if(_details[i].lockDay==0){//????????????0
                initDistAmount = add(initDistAmount, _details[i].oneDayTransferAmount);//???????????+??????
            }
            _erc20token.transfer(
                _details[i].founder,
               initDistAmount
            );
            _details[i].transferedAmount = initDistAmount;//???????????????
            _details[i].lastTransferDay =_distDay;//??????????????????
        }

        _fDist = true;//???????????
        updateFinishFlag();// ???????
    }

    // ??????????
    function updateFinishFlag() private {
        //
        bool allFinish = true;
        for(uint256 i=0; i<_details.length; i++){
            // ?????????????
            if (_details[i].lockPercent == 0) {
                _details[i].isFinish = true;
                continue;
            }
            // ?????????????????????
            if (_details[i].distAmount == _details[i].transferedAmount) {
                _details[i].isFinish = true;
                continue;
            }
            allFinish = false;
        }
        // ????????
        _fFinish = allFinish;
    }

    //??1??????????????????
    function applyForTokenOneDay() public{
        require(_mode == 1,"this function can be called only when _mode==1");//??1????
        require(_distDay != 0,"you haven't distributed");//??????????
        require(_fFinish == false, "not finish");//?????????
        require(_fCancelDist == false, "must not cancel dist");
        uint256 daysAfterDist;//?????????
        uint256 tday = today();//????????????
      
        for(uint256 i=0;i<_details.length;i++){
            // ?????????pass
            if (_details[i].isFinish == true) {
                continue;
            }

            require(tday!=_details[i].lastTransferDay,"you have applied for todays token");//????????
            daysAfterDist = sub(tday,_distDay);//?????????????
            if(daysAfterDist >= _details[i].lockDay){//????????????????
                if(add(_details[i].transferedAmount, _details[i].oneDayTransferAmount) <= _details[i].distAmount){
                //??????????????????????????????????????
                    _erc20token.transfer(
                        _details[i].founder,
                        _details[i].oneDayTransferAmount
                    );
                    //?????????????????
                    _details[i].transferedAmount = add(_details[i].transferedAmount, _details[i].oneDayTransferAmount);
                }
                else if(_details[i].transferedAmount < _details[i].distAmount){
                //????????????????????????????????????????
                    _erc20token.transfer(
                        _details[i].founder,
                        sub( _details[i].distAmount, _details[i].transferedAmount)
                    );
                    //?????????????????
                    _details[i].transferedAmount = _details[i].distAmount;
                }
                //????????????????????
                _details[i].lastTransferDay = tday;
            }
        }   
        // ???????
        updateFinishFlag();
    }

    ///??2???????????????????????????
    function applyForToken() public {
        require(_mode == 2,"this function can be called only when _mode==2");//??2????
        require(_distDay != 0,"you haven't distributed");//??????????
        require(_fFinish == false, "not finish");//?????????
        require(_fCancelDist == false, "must not cancel dist");
        uint256 daysAfterDist;//?????????
        uint256 expectAmount;//???????????????????????
        uint256 tday = today();//????????????
        uint256 expectReleaseTimesNoLimit = 0;//????????????????(??????????)

        for(uint256 i=0;i<_details.length;i++){
            // ?????????pass
            if (_details[i].isFinish == true) {
                continue;
            }
            //????????
            require(tday!=_details[i].lastTransferDay,"you have applied for todays token");
            daysAfterDist = sub(tday,_distDay);//?????????????
            if(daysAfterDist >= _details[i].lockDay){//????????????????
                expectReleaseTimesNoLimit = add(sub(daysAfterDist,_details[i].lockDay),1);//????????????????
                //????????????=??????????x??????????+??????? ???????????? ?????
                //????????????????????
                expectAmount = min(add(mul(expectReleaseTimesNoLimit,_details[i].oneDayTransferAmount),_details[i].initAmount),_details[i].distAmount);

                //????????????????
                _erc20token.transfer(
                    _details[i].founder,
                    sub(expectAmount, _details[i].transferedAmount)
                );
                //?????????????????
                _details[i].transferedAmount = expectAmount;
                //????????????????????
                _details[i].lastTransferDay = tday;
            }
        }
        // ???????
        updateFinishFlag();
    }

    //??????
    function today() public constant returns (uint256) {
        return div(time(), 24 hours);//24 hours 
    }
    
    //????????
    function time() public constant returns (uint256) {
        return block.timestamp;
    }
 
}