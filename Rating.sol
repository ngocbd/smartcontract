/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Rating at 0x8154ae317a767e69d7f427aebdfbdddadcd5cf48
*/
contract Rating {
        function setRating(bytes32 _key, uint256 _value) {
            ratings[_key] = _value;
        }
        mapping (bytes32 => uint256) public ratings;
    }