/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GetsBurned at 0x19c630bb6d3e7c2cfe77e2a73627c9bee2db8ac5
*/
contract GetsBurned {

    function () payable {
    }

    function BurnMe () {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}