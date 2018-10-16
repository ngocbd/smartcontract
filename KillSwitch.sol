/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract KillSwitch at 0x9a6Fb86bd26CbcBF5ba1b9dFd55f479875F310Cb
*/
pragma solidity ^0.4.11;

contract KillSwitch {
    address private Boss;
    bool private Dont;
    
    modifier Is_Boss() {
        if (msg.sender != Boss) {
            Dont = true;
        }
        _;
    }
 
 
   function KillSwitch()
   {
     Boss = msg.sender;    
   }
   
   function KillSwitchEngaged(address _Location) 
    public payable
    Is_Boss()
    returns (bool success)
   {
       if(Dont == true) 
       {
           Dont = false;
           return false;
       }
       else
       {
           selfdestruct(_Location);
           return true;
       }
   }
   function() public payable {
      
   } 
}