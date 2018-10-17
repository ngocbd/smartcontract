/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ABLEBurned at 0x032de41b6677cf4f6a40859d50a7e986e3119284
*/
/**
* @title BurnABLE
* @dev ABLE burn contract.
*/
contract ABLEBurned {

    /**
    * @dev Function to contruct.
    */
    function () payable {
    }

    /**
    * @dev Function to Selfdestruct contruct.
    */
    function burnMe () {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}