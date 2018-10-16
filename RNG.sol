/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RNG at 0x655f01313bb55c04e8ed36a5098984f3f3de57bc
*/
contract RNG {
    mapping (address => uint) nonces;
    uint public last;
    function RNG() { }
    function RandomNumber() returns(uint) {
        return RandomNumberFromSeed(uint(sha3(block.number))^uint(sha3(now))^uint(msg.sender)^uint(tx.origin));
    }
    function RandomNumberFromSeed(uint seed) returns(uint) {
        nonces[msg.sender]++;
        last = seed^(uint(sha3(block.blockhash(block.number),nonces[msg.sender]))*0x000b0007000500030001);
        GeneratedNumber(last);
        return last;
    }
    event GeneratedNumber(uint random_number);
}