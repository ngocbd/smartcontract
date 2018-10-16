/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Uint8Lib at 0x770adb04ea5dcd4bdb4b44a28fa830d19a570f5d
*/
/// @title Token Register Contract
/// @author Kongliang Zhong - <kongliang@loopring.org>,
/// @author Daniel Wang - <daniel@loopring.org>.
library Uint8Lib {
    function xorReduce(
        uint8[] arr,
        uint    len
        )
        public
        constant
        returns (uint8 res) {

        res = arr[0];
        for (uint i = 1; i < len; i++) {
           res ^= arr[i];
        }
    }
}