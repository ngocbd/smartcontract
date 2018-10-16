/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MiningRig at 0xe64aa1e4301d85ecaccfc15e4af887a1fe6f5f56
*/
pragma solidity ^0.4.11;

contract MiningRig {
    // ??
    string public warning = "??????????????";
    
    // ?????
    address public owner = 0x0;
    
    // ???????????? 0 
    uint public closeBlock = 0;
    
    // ???????????
    uint public totalNTD = 0;
    
    // ????????????? reward
    uint public totalWithdrew = 0;
    
    // ???????????
    mapping(address => uint) public usersNTD;
    
    // ??????? ether
    mapping(address => uint) public usersWithdrew;
    
    // ?? owner ?? ????
    modifier onlyOwner () {
        assert(owner == msg.sender);
        _;
    }
    
    // ???????? ????
    modifier beforeCloseBlock () {
        assert(block.number <= closeBlock);
        _;
    }
    
    // ???????? ????
    modifier afterCloseBlock () {
        assert(block.number > closeBlock);
        _;
    }
    
    // ?????????? ????
    modifier onlyMember () {
        assert(usersNTD[msg.sender] != 0);
        _;
    }
    
    // ???
    function MiningRig () {
        owner = msg.sender;
        closeBlock = block.number + 5760; // ??? block ?
    }
    
    // ????????? (????????????????)
    function Register (address theUser, uint NTD) onlyOwner beforeCloseBlock {
        usersNTD[theUser] += NTD;
        totalNTD += NTD;
    }
    
    // ???
    function Unregister (address theUser, uint NTD) onlyOwner beforeCloseBlock {
        assert(usersNTD[theUser] >= NTD);
        
        usersNTD[theUser] -= NTD;
        totalNTD -= NTD;
    }
    
    // ?????????
    function Withdraw () onlyMember afterCloseBlock {
        // ?????????? ether ???? balance + ???????
        uint everMined = this.balance + totalWithdrew;
        
        // ?? user ????????
        uint totalUserCanWithdraw = everMined * usersNTD[msg.sender] / totalNTD;
        
        // ?? user ???????
        uint userCanWithdrawNow = totalUserCanWithdraw - usersWithdrew[msg.sender];
        
        // ?? reentrance ???????
        totalWithdrew += userCanWithdrawNow;
        usersWithdrew[msg.sender] += userCanWithdrawNow;

        assert(userCanWithdrawNow > 0);
        
        msg.sender.transfer(userCanWithdrawNow);
    }
    
    // ????
    // ?????????? ether ??
    function Cashing (address targetAddress, uint permilleToCashing) onlyMember afterCloseBlock {
        //permilleToCashing ????
        assert(permilleToCashing <= 1000);
        assert(permilleToCashing > 0);
        
        // ?????????? ether ???? balance + ???????
        uint everMined = this.balance + totalWithdrew;
        
        // ???????? user ????????
        uint totalUserCanWithdraw = everMined * usersNTD[msg.sender] / totalNTD;
        
        // ???????? user ???????
        uint userCanWithdrawNow = totalUserCanWithdraw - usersWithdrew[msg.sender];
        
        // ?????? user ????????
        uint totalTargetUserCanWithdraw = everMined * usersNTD[targetAddress] / totalNTD;
        
        // ?????? user ???????
        uint targetUserCanWithdrawNow = totalTargetUserCanWithdraw - usersWithdrew[targetAddress];
        
        // ?????????????????????? ether
        assert(userCanWithdrawNow == 0);
        assert(targetUserCanWithdrawNow == 0);
        
        uint NTDToTransfer = usersNTD[msg.sender] * permilleToCashing / 1000;
        uint WithdrewToTransfer = usersWithdrew[msg.sender] * permilleToCashing / 1000;
        
        usersNTD[msg.sender] -= NTDToTransfer;
        usersWithdrew[msg.sender] -= WithdrewToTransfer;
        
        usersNTD[targetAddress] += NTDToTransfer;
        usersWithdrew[targetAddress] += WithdrewToTransfer;
    }
    
    function ContractBalance () constant returns (uint) {
        return this.balance;
    }
    
    function ContractTotalMined() constant returns (uint) {
        return this.balance + totalWithdrew;
    }
    
    function MyTotalNTD () constant returns (uint) {
        return usersNTD[msg.sender];
    }
    
    function MyTotalWithdrew () constant returns (uint) {
        return usersWithdrew[msg.sender];
    }
 
    function () payable {}
}