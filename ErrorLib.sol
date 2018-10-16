/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ErrorLib at 0xd8a8f37573628d53e3f7537412e5e8c54bb4e761
*/
/// @title Token Register Contract
/// @author Daniel Wang - <daniel@loopring.org>.
library ErrorLib {

    event Error(string message);

    /// @dev Check if condition hold, if not, log an exception and revert.
    function orThrow(bool condition, string message) public constant {
        if (!condition) {
            error(message);
        }
    }

    function error(string message) public constant {
        Error(message);
        revert();
    }
}