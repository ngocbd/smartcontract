/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract USDOracle at 0x1c68f4f35ac5239650333d291e6ce7f841149937
*/
contract OraclizeI {
    function getPrice(string _datasource, uint _gas_limit) returns (uint _dsprice);
    function query(uint _timestamp, string _datasource, string _arg) returns (bytes32 _id);
}
contract OraclizeAddrResolverI {
    function getAddress() returns (address _addr);
}


contract USDOracle {
    OraclizeAddrResolverI OAR = OraclizeAddrResolverI(0x1d11e5eae3112dbd44f99266872ff1d07c77dce8);

    function USDOracle() {
    }

    function initialize() public {
        var oraclize = OraclizeI(OAR.getAddress());
        oraclize.query.value(msg.value)(0, "URL", "http://example.com");
    }

    function getPriceProxy() constant returns (uint) {
        var oraclize = OraclizeI(OAR.getAddress());
        return oraclize.getPrice("URL", 200000);
    }

    function oneCentOfWei() constant returns (uint) {
        var oraclize = OraclizeI(OAR.getAddress());
        var price = oraclize.getPrice("URL", 200000);
        var one_cent_of_wei = price - tx.gasprice * 200000;
        return one_cent_of_wei;
    }

    function WEI() constant returns (uint) {
        // 1 USD in WEI
        return oneCentOfWei() * 100;
    }

    function USD() constant returns (uint) {
        // 1 ETH in USD
        return 1 ether / oneCentOfWei();
    }
}