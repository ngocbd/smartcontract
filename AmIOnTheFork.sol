/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AmIOnTheFork at 0xe0b8fce1183e31c995b40460e6cb6712fa929f59
*/
contract AmIOnTheFork {
    bool public forked = false;
    address constant darkDAO = 0x304a554a310c7e546dfe434669c62820b7d83490;
    // Check the fork condition during creation of the contract.
    // This function should be called between block 1920000 and 1930000.
    // After that the status will be locked in.
    function update() {
        if (block.number >= 1920000 && block.number <= 1930000) {
            forked = darkDAO.balance < 3600000 ether;
        }
    }
    function() {
        throw;
    }
}