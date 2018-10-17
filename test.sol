/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0xdf1b19c9fb0fae3b0e6bef73ee792a72a19104e2
*/
pragma solidity ^0.4.24;

contract wordbot { function getWords(uint _wordcount) public view returns (bytes6[]) {} }

contract test {
    wordbot wordbot_contract = wordbot(0xA95E23ac202ad91204DA8C1A24B55684CDcC19B3);
    
    uint wordcount = 12;
    string[12] public human_readable_blockhash;
    
    modifier one_time_use {
        require(keccak256(abi.encodePacked(human_readable_blockhash[0])) == keccak256(abi.encodePacked("")));
        _;
    }
    
    function record_human_readable_blockhash() 
        one_time_use public
    {
        bytes6[] memory word_sequence = new bytes6[](wordcount);
        word_sequence = wordbot_contract.getWords(wordcount);
        
        for(uint i = 0; i<wordcount; i++) {
            bytes6 word = word_sequence[i];
            bytes memory toBytes = new bytes(6);
            assembly {
                toBytes := mload(word)
            }
            human_readable_blockhash[i] = string(toBytes);
        }
        
    }
    
}