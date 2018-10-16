/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ClassicCheck at 0x882fb4240f9a11e197923d0507de9a983ed69239
*/
contract ClassicCheck {
    
    bool public classic;
 
    function ClassicCheck(){
        if (address(0xbf4ed7b27f1d666546e30d74d50d173d20bca754).balance > 1000000 ether)
            classic = false;
        else
            classic = true;
    }   
    
    function isClassic() constant returns (bool isClassic) {
        return classic;
    }
}