/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0x896350cc0e416727262b339e307e4ef62078a4c3
*/
contract test {

        uint _multiplier;

        constructor (uint multiplier) public {
             _multiplier = multiplier;
        }

        function multiply(uint a) public view returns(uint d)  
        {
             return a * _multiplier;
        }
    }