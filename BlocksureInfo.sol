/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlocksureInfo at 0xF3f2BbbBD5a1986944C6A4B9C8B37004E04dc8F6
*/
contract BlocksureInfo {

    address public owner;
    string public name;
    
    mapping (string => string) strings;

    function BlocksureInfo() {
        owner = tx.origin;
    }
    
    modifier onlyowner { if (tx.origin == owner) _ }

    function addString(string _key, string _value) onlyowner {
        strings[_key] = _value;
    }
    
    function setOwner(address _owner) onlyowner {
        owner = _owner;
    }
    
    function setName(string _name) onlyowner {
        name = _name;
    }
    
    function destroy() onlyowner {
        suicide(owner);
    }
}