/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x954De93D9f1Cd1e2e3AE5964F614CDcc821Fac64
*/
contract SimpleStorage {
    event valueChanged(string oldValue, string newValue);

    string _value;

    function setValue(string value) {
        valueChanged(_value, value);
        _value = value;
    }

    function getValue() constant returns (string) {
        return _value;
    }
}