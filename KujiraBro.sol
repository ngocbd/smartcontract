/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract KujiraBro at 0x2fa59e2c57a80631c4cd029dc343febb89bb4e14
*/
pragma solidity ^0.4.21;

  /*
  
  Volume Feeder for Proof of Community (POC)
  KujiraBro Loves Ethereum but he Loves POC tokens more. 
  He will Buy and HODL PoC tokens and spread his Divies. 
  However when he has a bit too much POC he will sell for the sake of volatility. 
  All his divies go back into buying more POC and Spreading more Divies. 

  KujiraBro is Proof of Community's best Buddy. 
  
  */

contract KujiraBro 
{
    
    /*
      Modifiers
      ???
     */

    // Only the person that published this contract
    // ??????????
    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }
    
    // Only PoC token contract
    // ??PoC????
    modifier notPoC(address aContract)
    {
        require(aContract != address(pocContract));
        _;
    }
   
    /*
      Events
      ??
     */
    event Deposit(uint256 amount, address depositer);
    event Purchase(uint256 amountSpent);
    event Sell(uint256 tokensSold);
    event Transfer(uint256 amount, address paidTo);

   /**
      Global Variables
      ????
     */
    address owner;
    address RandDWallet;
    uint256 tokenBalance;
    PoC pocContract;
    uint256 minimumTokenBalance;
    uint256 maximumTokenBalance = 5000e18; //5000 tokens
    uint256 tokensToSell = 2500; 
    uint256 RandDFee = 1;
   
    
    /*
       Constructor
       ???
     */
    constructor(address RDWallet) 
    public 
    {
        owner = msg.sender;
        RandDWallet = RDWallet;
        pocContract = PoC(address(0x1739e311ddBf1efdFbc39b74526Fd8b600755ADa));
        tokenBalance = 0;
    }
    
    function() payable public { }
     
    /*
      Only way to give contract ETH and have it immediately use it, is by using donate function
      ???ETH???????????????????
     */
    function donate() 
    public payable 
    {
        //You have to send more than 1000000 wei
        //???????1000000 wei
        require(msg.value > 1000000 wei);
        uint256 ethToRandD = address(this).balance / 100;
        uint256 ethToTransfer = address(this).balance - ethToRandD;
        uint256 PoCEthInContract = address(pocContract).balance;

        RandDWallet.transfer(ethToRandD);
       
        // if PoC contract balance is less than 5 ETH, PoC is dead and there is no reason to pump it
        // ??PoC??????5 ETH?PoC?????????????
        if(PoCEthInContract < 5 ether)
        {
            pocContract.exit();
            tokenBalance = 0;

            owner.transfer(ethToTransfer);
            emit Transfer(ethToTransfer, address(owner));
        }

        // let's buy and sell tokens to give dividends to PoC tokenholders
        // ????????PoC???????
        else 
        {
            tokenBalance = myTokens();

             // if token balance is greater than maximumTokenBalance, sell
            if(tokenBalance > maximumTokenBalance)
            {
                pocContract.sell(tokenBalance - tokensToSell);
                pocContract.withdraw();
                tokenBalance = myTokens(); 
                emit Sell(tokenBalance - tokensToSell);
            }
            else 
            {   
                if(ethToTransfer > 0)
                {
                    pocContract.buy.value(ethToTransfer)(0x0);
                    emit Purchase(ethToTransfer);
                }
            }
        }

        emit Deposit(msg.value, msg.sender);
    }

    
    /**
       Number of tokens the contract owns.
       ??????????
     */
    function myTokens() 
    public 
    view 
    returns(uint256)
    {
        return pocContract.myTokens();
    }
    
    /**
       Number of dividends owed to the contract.
       ?????????
     */
    function myDividends() 
    public 
    view 
    returns(uint256)
    {
        return pocContract.myDividends(true);
    }

    /**
       ETH balance of contract
       ???ETH??
     */
    function ethBalance() 
    public 
    view 
    returns (uint256)
    {
        return address(this).balance;
    }

    /**
       If someone sends tokens other than PoC tokens, the owner can return them.
       ???????PoC???????????????????
     */
    function transferAnyERC20Token(address tokenAddress, address tokenOwner, uint tokens) 
    public 
    onlyOwner() 
    notPoC(tokenAddress) 
    returns (bool success) 
    {
        return ERC20Interface(tokenAddress).transfer(tokenOwner, tokens);
    }
    
    /**
       Owner can update when this contract will sell tokens
     */
    function updateMaxTokenLimit(uint256 amount)
    public
    onlyOwner()
    {
        maximumTokenBalance = amount;
    }

    /**
       Owner can update how many tokens contract will sell
     */
    function updateTokenSellAmount(uint256 amount)
    public
    onlyOwner()
    {
        tokensToSell = amount;
    }

    function sellTokensNow(uint256 tokensToSell)
    public
    onlyOwner()
    {
        require(myTokens() >= tokensToSell);

        pocContract.sell(tokensToSell);
        pocContract.withdraw();

        emit Sell(tokensToSell);
    }
}

// Define the PoC token for the contract
// ?????PoC??
contract PoC 
{
    function buy(address) public payable returns(uint256);
    function exit() public;
    function sell(uint256) payable public;
    function withdraw() public;
    function myTokens() public view returns(uint256);
    function myDividends(bool) public view returns(uint256);
    function totalEthereumBalance() public view returns(uint);
}

// Define ERC20Interface.transfer, so contract can transfer tokens accidently sent to it.
// ??ERC20 Interface.transfer???????????????????
contract ERC20Interface 
{
    function transfer(address to, uint256 tokens) 
    public 
    returns (bool success);
}