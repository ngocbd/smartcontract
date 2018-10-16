/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PizzaPoll at 0x1a8ad1257ba89e55fdbd71436931f9714dbfb9f6
*/
pragma solidity ^0.4.13;

contract PizzaPoll {
    mapping (address => bool) pizzaIsLiked;
    mapping (address => uint) likeCount;
    mapping (address => uint) dislikeCount;

    function PizzaPoll() { 
        likeCount[msg.sender] = 0;
        dislikeCount[msg.sender] = 0;
    }

    function GetLikeCount() returns (uint count){
        return likeCount[msg.sender];
    }

    function GetDislikeCount() returns (uint count) {
        return dislikeCount[msg.sender];
    }

    function Vote (address voterAddress, bool isLiked)
    {
        pizzaIsLiked[voterAddress] = isLiked;

        if (isLiked)
        {
            likeCount[msg.sender] += 1;    
        }
        else
        {
            dislikeCount[msg.sender] += 1;
        }
    }
}