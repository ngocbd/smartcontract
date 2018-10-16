/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Test at 0xdd29e9818ddf08253486006ae0f82efb2f50db2e
*/
contract Test {

	mapping (uint32 => bytes32) Cert;	
	
	function SetCert (uint32 _IndiceIndex, bytes32 _Cert) {
		if (msg.sender == 0x46b396728e61741D3AbD6Aa5bfC42610997c32C3) {
			Cert [_IndiceIndex] = _Cert;
		}
	}				
	
	function GetCert (uint32 _IndiceIndex) returns (bytes32 _Valeur)  {
		_Valeur = Cert [_IndiceIndex];
		return _Valeur;
	}		
}