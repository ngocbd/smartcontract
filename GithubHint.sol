/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GithubHint at 0x27c41d20014fa87291006d02ddd81b2128039bd7
*/
//! Github Hinting contract.
//! By Gav Wood (Ethcore), 2016.
//! Released under the Apache Licence 2.

contract GithubHint {
    struct Entry {
        string accountSlashRepo;
        bytes20 commit;
        address owner;
    }
    
    modifier when_edit_allowed(bytes32 _content) { if (entries[_content].owner != 0 && entries[_content].owner != msg.sender) return; _ }
    
    function hint(bytes32 _content, string _accountSlashRepo, bytes20 _commit) when_edit_allowed(_content) {
        entries[_content] = Entry(_accountSlashRepo, _commit, msg.sender);
    }

    function hintURL(bytes32 _content, string _url) when_edit_allowed(_content) {
        entries[_content] = Entry(_url, 0, msg.sender);
    }

    function unhint(bytes32 _content) when_edit_allowed(_content) {
        delete entries[_content];
    }
    
    mapping (bytes32 => Entry) public entries;
}