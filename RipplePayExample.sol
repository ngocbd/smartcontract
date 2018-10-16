/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RipplePayExample at 0xBE69b8093Ca446C97AA2C5eA4746D793fb86C89d
*/
contract RipplePayExample {

mapping(address => mapping(address => uint)) TrustSettings; // store trustLines for a given address

function updateTrustSettings(address _peer, uint newTrustLimit) {
TrustSettings[msg.sender][_peer] = newTrustLimit;
}

function getTrustSetting(address _peer) returns(uint) {
return TrustSettings[msg.sender][_peer];
}
}