/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TestRevert at 0xa86e4aeddf4336940e17d524000f1a0cef7c1fe9
*/
contract TestRevert {
    
    function revertMe() {
        require(false);
    }
    
    function throwMe() {
        throw;
    }
}