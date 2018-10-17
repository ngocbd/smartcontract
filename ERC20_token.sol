/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERC20_token at 0x202420b04276ff4dd5cf3b4ec582b738c16190aa
*/
pragma solidity ^0.4.19;      // ??Compiler??

contract ERC20_token {   // ?? is ?? ERC20_interface
    uint256 public totalSupply;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value, string _text); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    uint256 constant private MAX_UINT256 = 2**256 - 1; // ????uint256?????????overflow
    mapping (address => uint256) public balances;   // ????? balances[??] ?????????
    mapping (address => mapping (address => uint256)) public allowed;  // ?? allowed[??][??]????????????????????

    string public name;             // ??????
    uint8  public decimals = 18;    // ?????????18
    string public symbol;           // e.g. ^_^
    address owner;
    uint256 public buyPrice;   // ???Ether?????token
    uint private weiToEther = 10 ** 18; // ????wei??Ether

    // ???????????????????????????
    constructor (
        uint256 _initialSupply,
        uint256 _buyPrice,
        string _tokenName,
        string _tokenSymbol
    ) public {
        totalSupply = _initialSupply * 10 ** uint256(decimals); // token??
        balances[msg.sender] = totalSupply;                    // ???Token???????????      

        name = _tokenName;                                   // token??
        symbol = _tokenSymbol;                               // token ??
        owner = msg.sender;                                  // ?????
        buyPrice = _buyPrice;                                // ??? ether ???
    }
    
    // ???????????????function
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // ????
    function balanceOf(address _owner) public view returns (uint256 balance) {
      return balances[_owner];
    }

    // ??????????
    function transfer(address _to, uint256 _value, string _text) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value, _text);
        return true;
    }

    // ????????????????????????????????(msg.sender)??????(_from)?????(_to)
    function transferFrom(address _from, address _to, uint256 _value, string _text) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value, _text);
        return true;
    }

    // ??????????  ???????(msg.sender)???(_spender)???????????value
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // ?????????????????
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }   

    // ??token????????????????
    function setPrice(uint _price) public onlyOwner {
        buyPrice = _price;
    }

    // ??token
    function buy() public payable {
        uint amount;
        amount = msg.value * buyPrice * 10 ** uint256(decimals) / weiToEther;    // ????token
        require(balances[owner] >= amount);              // ????????token???
        balances[msg.sender] += amount;                  // ?????token   
        balances[owner] -= amount;                        // ?????token
        emit Transfer(msg.sender, owner, amount, 'Buy token');               // ??token??log
    }

    // ?????Ether??????
    function withdraw(uint amount) public onlyOwner {
        owner.transfer(amount * weiToEther);
    }
}