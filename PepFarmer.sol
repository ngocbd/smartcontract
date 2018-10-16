/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PepFarmer at 0x7a3d8ab221d66e4a546a0bcd21a87787d5bf47c3
*/
pragma solidity ^0.4.18;

interface CornFarm
{
    function buyObject(address _beneficiary) public payable;
}

interface Corn
{
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function transfer(address to, uint256 value) public returns (bool);
}

contract PepFarmer {

    address public shop = 0x5f277da6734Cb32e182C8252467dF39D6EC424B4;
    address public object = 0x12105bd41f403e33d444049884B000CC8D438AcB;
    address public farmer;
    
    function PepFarmer(){
        farmer = msg.sender;
    }

    function pepFarm() external {
        for (uint8 i = 0; i < 100; i++) {
            CornFarm(shop).buyObject(this);
        }
    }
    
    function reapFarm() external {
        Corn(object).transfer(farmer, Corn(object).balanceOf(this));
    }
    
    function set(address _shop, address _object){
        if(msg.sender == farmer){
            shop = _shop;
            object = _object;
        }
    }
}