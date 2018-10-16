/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LoanDirectory at 0xc477042db387dd59c038ca4b829a07964b674347
*/
pragma solidity ^0.4.10;

contract Loan {
    uint8 public constant STATUS_INITIAL = 1;
    uint8 public constant STATUS_LENT = 2;
    uint8 public constant STATUS_PAID = 3;

    string public versionCode;
    
    address public borrower;
    address public lender;

    uint8 public status;

    uint256 public amount;
    uint256 public paid;

    event ApprovedBy(address _address);
    event DestroyedBy(address _address);
    event PartialPayment(address _sender, address _from, uint256 _amount);
    event Transfer(address _from, address _to);
    event TotalPayment();

    function pay(uint256 _amount, address _from);
    function destroy();
    function lend();
    function approve();
    function isApproved() returns (bool);
}

contract LoanDirectory {
    Loan[] public loans;

    function registerLoan(Loan loan) {
        require(loan.status() == loan.STATUS_INITIAL()); // Check if loan implements Loan interface
        loans.push(loan);
    }
    
    function registerLoanReplace(Loan loan, uint256 indexReplace) {
        require(indexReplace < loans.length);
        Loan replaceLoan = loans[indexReplace]; // Get loan to delete
        require(replaceLoan.status() != replaceLoan.STATUS_INITIAL());
        require(loan.status() == loan.STATUS_INITIAL());
        loans[indexReplace] = loan;
    }

    function registerLoanReplaceDuplicated(Loan loan, uint256 replaceA, uint256 replaceB) {
        require(replaceA < loans.length && replaceB < loans.length);
        require(replaceA != replaceB);
        require(loans[replaceA] == loans[replaceB]);
        require(loan.status() == loan.STATUS_INITIAL());
        loans[replaceA] = loan;
    }

    function getAllLoans() constant returns (Loan[]) {
        return loans;
    }
}