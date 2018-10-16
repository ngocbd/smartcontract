/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WithdrawDAO at 0x826a490c2d5d7ccb5f0223b042b39a9dc3cfdfe6
*/
// Refund contract for trust DAO #16

contract DAO {
    function balanceOf(address addr) returns (uint);
    function transferFrom(address from, address to, uint balance) returns (bool);
    uint public totalSupply;
}

contract WithdrawDAO {
    DAO constant public mainDAO = DAO(0x200450f06520bdd6c527622a273333384d870efb);
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