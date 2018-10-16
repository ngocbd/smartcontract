/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WithdrawDAO at 0x479bed65685b0672ec2ff8b0a8fbe06b4ce0a710
*/
// Refund contract for trust DAO #29

contract DAO {
    function balanceOf(address addr) returns (uint);
    function transferFrom(address from, address to, uint balance) returns (bool);
    uint public totalSupply;
}

contract WithdrawDAO {
    DAO constant public mainDAO = DAO(0x9ea779f907f0b315b364b0cfc39a0fde5b02a416);
    address constant public trustee = 0xda4a4626d3e16e094de3225a751aab7128e96526;

    function withdraw(){
        uint balance = mainDAO.balanceOf(msg.sender);

        if (!mainDAO.transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
            throw;
    }

    function trusteeWithdraw() {
        trustee.send((this.balance + mainDAO.balanceOf(this)) - mainDAO.totalSupply());
    }
}