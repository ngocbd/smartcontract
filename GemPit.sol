/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GemPit at 0xf5b59c107f3f7b1c2a7c3d09234bd0a055ad8d55
*/
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

pragma solidity ^0.4.18;

contract DSToken {
    function totalSupply() public view returns (uint);
    function balanceOf(address guy) public view returns (uint);
    function allowance(address src, address guy) public view returns (uint);

    function approve(address guy, uint wad) public returns (bool);
    function transfer(address dst, uint wad) public returns (bool);
    function transferFrom(address src, address dst, uint wad) public returns (bool);

    function approve(address guy) public returns (bool);
    function push(address dst, uint wad) public;
    function pull(address src, uint wad) public;
    function move(address src, address dst, uint wad) public;
    function mint(uint wad) public;
    function burn(uint wad) public;
    function mint(address guy, uint wad) public;
    function burn(address guy, uint wad) public;
    function setName(bytes32 name_) public;
}

contract GemPit {
    function burn(DSToken gem) public {
        gem.burn(gem.balanceOf(this));
    }
}