/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AnalyticProxy at 0x717D6E8B55E0FdF94D74bb27208f5b6074Dd9cD4
*/
contract InvestmentAnalytics {
function iaInvestedBy(address investor) external payable;
}

/*
 * @title This is proxy for analytics. Target contract can be found at field m_analytics (see "read contract").
 * @author Eenae

 * FIXME after fix of truffle issue #560: refactor to a separate contract file which uses InvestmentAnalytics interface
 */
contract AnalyticProxy {

    function AnalyticProxy() {
        m_analytics = InvestmentAnalytics(msg.sender);
    }

    /// @notice forward payment to analytics-capable contract
    function() payable {
        m_analytics.iaInvestedBy.value(msg.value)(msg.sender);
    }

    InvestmentAnalytics public m_analytics;
}