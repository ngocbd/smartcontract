/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OreOreCoin at 0xd7faabc1a2ad0b6ba3651816ee97c10dcadd3b85
*/
pragma solidity ^0.4.8;

// ??? ??? ??
contract Owned {
    // ?? ??
    address public owner; // ??? ??

    // ??? ?? ? ???
    event TransferOwnership(address oldaddr, address newaddr);

    // ??? ?? ???? ???
    modifier onlyOwner() { if (msg.sender != owner) return; _; }

    // ???
    function Owned() public {
        owner = msg.sender; // ??? ??? ??? ??? ???? ??
    }
    
    // (1) ??? ??
    function transferOwnership(address _new) onlyOwner public {
        address oldaddr = owner;
        owner = _new;
        emit TransferOwnership(oldaddr, owner);
    }
}

// (2) ?? ??? ??
contract Members is Owned {
    // (3) ?? ?? ??
    address public coin; // ??(?? ??) ??
    MemberStatus[] public status; // ?? ?? ??
    mapping(address => History) public tradingHistory; // ??? ?? ??
     
    // (4) ?? ??? ???
    struct MemberStatus {
        string name; // ???
        uint256 times; // ?? ?? ??
        uint256 sum; // ?? ?? ??
        int8 rate; // ??? ??
    }
    // ?? ??? ???
    struct History {
        uint256 times; // ?? ??
        uint256 sum; // ?? ??
        uint256 statusIndex; // ?? ???
    }
 
    // (5) ?? ?? ???? ???
    modifier onlyCoin() { if (msg.sender == coin) _; }
     
    // (6) ?? ?? ??
    function setCoin(address _addr) onlyOwner public {
        coin = _addr;
    }
     
    // (7) ?? ?? ??
    function pushStatus(string _name, uint256 _times, uint256 _sum, int8 _rate) onlyOwner public {
        status.push(MemberStatus({
            name: _name,
            times: _times,
            sum: _sum,
            rate: _rate
        }));
    }
 
    // (8) ?? ?? ?? ??
    function editStatus(uint256 _index, string _name, uint256 _times, uint256 _sum, int8 _rate) onlyOwner public {
        if (_index < status.length) {
            status[_index].name = _name;
            status[_index].times = _times;
            status[_index].sum = _sum;
            status[_index].rate = _rate;
        }
    }
     
    // (9) ?? ?? ??
    function updateHistory(address _member, uint256 _value) onlyCoin public {
        tradingHistory[_member].times += 1;
        tradingHistory[_member].sum += _value;
        // ??? ?? ?? ??(???? ??)
        uint256 index;
        int8 tmprate;
        for (uint i = 0; i < status.length; i++) {
            // ?? ?? ??, ?? ?? ?? ?? ? ?? ??? ??? ?? ???? ??
            if (tradingHistory[_member].times >= status[i].times &&
                tradingHistory[_member].sum >= status[i].sum &&
                tmprate < status[i].rate) {
                index = i;
            }
        }
        tradingHistory[_member].statusIndex = index;
    }

    // (10) ??? ?? ??(??? ??? ???? ?? ??)
    function getCashbackRate(address _member) public constant returns (int8 rate){
        rate = status[tradingHistory[_member].statusIndex].rate;
    }
}
     
// (11) ?? ?? ??? ??? ?? ??
contract OreOreCoin is Owned{
    // ?? ?? ??
    string public name; // ?? ??
    string public symbol; // ?? ??
    uint8 public decimals; // ??? ?? ???
    uint256 public totalSupply; // ?? ??
    mapping (address => uint256) public balanceOf; // ? ??? ??
    mapping (address => int8) public blackList; // ?????
    mapping (address => Members) public members; // ? ??? ?? ??
     
    // ??? ??
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Blacklisted(address indexed target);
    event DeleteFromBlacklist(address indexed target);
    event RejectedPaymentToBlacklistedAddr(address indexed from, address indexed to, uint256 value);
    event RejectedPaymentFromBlacklistedAddr(address indexed from, address indexed to, uint256 value);
    event Cashback(address indexed from, address indexed to, uint256 value);
     
    // ???
    function OreOreCoin(uint256 _supply, string _name, string _symbol, uint8 _decimals) public {
        balanceOf[msg.sender] = _supply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _supply;
    }
 
    // ??? ?????? ??
    function blacklisting(address _addr) onlyOwner public {
        blackList[_addr] = 1;
        emit Blacklisted(_addr);
    }
 
    // ??? ??????? ??
    function deleteFromBlacklist(address _addr) onlyOwner public {
        blackList[_addr] = -1;
        emit DeleteFromBlacklist(_addr);
    }
 
    // ?? ?? ?? ??
    function setMembers(Members _members) public {
        members[msg.sender] = Members(_members);
    }
 
    // ??
    function transfer(address _to, uint256 _value)  public{
        // ?? ?? ??
        if (balanceOf[msg.sender] < _value) return;
        if (balanceOf[_to] + _value < balanceOf[_to]) return;

        // ?????? ???? ??? ??? ??
        if (blackList[msg.sender] > 0) {
            emit RejectedPaymentFromBlacklistedAddr(msg.sender, _to, _value);
        } else if (blackList[_to] > 0) {
            emit RejectedPaymentToBlacklistedAddr(msg.sender, _to, _value);
        } else {
            // (12) ??? ??? ??(? ??? ??? ??)
            uint256 cashback = 0;
            if(members[_to] > address(0)) {
                cashback = _value / 100 * uint256(members[_to].getCashbackRate(msg.sender));
                members[_to].updateHistory(msg.sender, _value);
            }
 
            balanceOf[msg.sender] -= (_value - cashback);
            balanceOf[_to] += (_value - cashback);
 
            emit Transfer(msg.sender, _to, _value);
            emit Cashback(_to, msg.sender, cashback);
        }
    }
}