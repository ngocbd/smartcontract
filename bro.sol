/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract bro at 0x98c12a825a6093ec88cd6e7cbf925f0f59cf0bb9
*/
pragma solidity ^0.4.19;
contract bro {
    uint8 nextNonce;
    address nextBroAddress;
    address[] bros;
    function Bro() 
        public 
    {
        nextNonce = 1;
        bros.push(0x0);
    }
    function nextBro()
        public
        returns(address)
    {
        nextBroAddress = findNextBro(nextNonce);
        
        bros.push(nextBroAddress);
        nextNonce += 1;
        return nextBroAddress;
    }
    function findNextBro(uint8 _nonce) 
        private 
        pure
        returns (address)
    {
        require(_nonce < 127);
        return address(keccak256(0xd6, 0x94, 0x0EA7AB495A36e59cc53A02C8F4a48C96df69DCDe, _nonce));
    }
}