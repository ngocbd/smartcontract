/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorld at 0xa4ebb48e4378e6f771b7f857623298bdb50c11b1
*/
/*
 * DO NOT EDIT! DO NOT EDIT! DO NOT EDIT!
 *
 * This is an automatically generated file. It will be overwritten.
 *
 * For the original source see
 *    '/Users/ragolta/ETH/swaldman/helloworld/src/main/solidity/helloworld.sol'
 */

pragma solidity ^0.4.18;





contract HelloWorld{
    string input = "Hello world.";

    function sayHello() view public returns (string) {
        return input;
    }

    function setNewGreeting(string greeting) public {
        input = greeting;
    }
}