/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract calc at 0xc02df3e98cbc4416e5471f51ea57ce8845a844cd
*/
contract calc { 
    event ret(uint r);
    function multiply(uint a, uint b) returns(uint d) { 
        uint res = a * b;
        ret (res);
        return res; 
    } 
}