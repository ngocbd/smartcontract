/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WithdrawDAO at 0x9aa7889526708afdfb6c5222e47ed96bfdacb945
*/
// Refund contract for trust DAO #63

contract DAO {
    function balanceOf(address addr) returns (uint);
    function transferFrom(address from, address to, uint balance) returns (bool);
    uint public totalSupply;
}

contract WithdrawDAO {
    DAO constant public mainDAO = DAO(0x0101f3be8ebb4bbd39a2e3b9a3639d4259832fd9);
    address public trustee = 0x46664c1e2ddd896a3e0c2b3d502842f261b9e62f;

    function withdraw(){
        uint balance = mainDAO.balanceOf(msg.sender);

        if (!mainDAO.transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
            throw;
    }

    function trusteeWithdraw() {
        trustee.send((this.balance + mainDAO.balanceOf(this)) - mainDAO.totalSupply());
    }
}