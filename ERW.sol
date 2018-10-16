/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERW at 0xFE70f7D0Fe6Ceb71D4FC0308322fFA6098043E43
*/
contract ERW {
    string public EdgarRichardWunsche;
    string public Parents;
    string public DateOfBirth;
    string public DateOfDeath;
    string public Location;
    
    function ERW() {
        EdgarRichardWunsche = "Edgar Richard Wunsche (12.11.1930-22.04.2016). Rest in Peace Dad. Love Alan.";
        DateOfBirth = "12.11.1930";
        DateOfDeath = "22.04.2016";
        Parents = "Beloved son of Anna Wunsche (Moser) and Antonin Wunsche.";
        Location = "Toronto, Ontario, Canada";
    }

    function () {
        throw;     // Prevents accidental sending of ether
    }
}