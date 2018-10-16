/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleLotto at 0xd43cbd8a74535327a8a196ea36cd44fc799ca289
*/
contract SimpleLotto {
    int playCount = 0;
    address owner = msg.sender;
    mapping (address => uint) public players;

    modifier onlyBy(address _account) {
        if (msg.sender != _account)
            throw;
        _
    }
    
    event Sent(address from, address to, int amount);
    
    function play(address receiver, uint amount) external constant returns (int playCount){
        playCount++;
      Sent(owner, receiver, playCount);
      players[receiver] += amount;
      return playCount;
    } 
    
    function play1(address receiver, uint amount) external  returns (int playCount){
        playCount++;
      Sent(owner, receiver, playCount);
      players[receiver] += amount;
      return playCount;
    } 
    
    function play2(address receiver, uint amount) public returns (int playCount){
        playCount++;
        Sent(owner, receiver, playCount);
        players[receiver] += amount;
        return playCount;
    } 
    
        function play4(address receiver, uint amount) returns (int playCount){
        playCount++;
        Sent(owner, receiver, playCount);
        players[receiver] += amount;
        return playCount;
    } 

    function terminate() { 
        if (msg.sender == owner)
            suicide(owner); 
    }
    
    function terminateAlt() onlyBy(owner) { 
            suicide(owner); 
    }
}