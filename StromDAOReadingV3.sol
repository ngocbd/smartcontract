/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StromDAOReadingV3 at 0x26f5ada7295f4557822b5ca8636381b6ac07206b
*/
contract StromDAOReadingV3  {
    
   mapping(address=>uint256) public readings;
   event pinged(address link,uint256 time,uint256 total,uint256 delta);
   
   function pingDelta(uint256 _delta) {
       readings[msg.sender]+=_delta;
       pinged(msg.sender,now,readings[msg.sender],_delta);
   }
   
   function pingReading(uint256 _reading) {
       pinged(msg.sender,now,_reading,_reading-readings[msg.sender]);
       readings[msg.sender]=_reading;
   }
}