/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherVote at 0xe9da10f1aba727bfb3641846ed4d5bbf2add39c4
*/
/* 
Based on a contract built by Vlad and Vitalik for Ether signal
If you need a license, refer to WTFPL.
*/

contract EtherVote {
    event LogVote(bytes32 indexed proposalHash, bool pro, address addr);
    function vote(bytes32 proposalHash, bool pro) {
        // don't accept ether
        if (msg.value > 0) throw;
        // Log the vote
        LogVote(proposalHash, pro, msg.sender);
    }
}