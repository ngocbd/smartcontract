/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract two at 0x6a92b2804EaeF97f222d003C94F683333e330693
*/
contract two {
    
    address public deployer;
    
    
    function two() {
        deployer = msg.sender;
    }
    
    
    function pay() {
        deployer.send(this.balance);
    }
    
    
    function() {
        pay();
    }
    
    
}