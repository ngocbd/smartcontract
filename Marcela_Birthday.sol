/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Marcela_Birthday at 0x702a891a043410fc0a57637df4cc1d673284566b
*/
pragma solidity ^0.4.15;

contract Marcela_Birthday {


string public name ;

string public date;

string public hour;

string public local;


function Marcela_Birthday(string _name, string _date, string _hour ,string _local){
name = _name;
date = _date;
hour = _hour;
local = _local;
}


function getinfo () public constant returns (string,string,string,string) {
    
 return(name,date,hour,local);
}
}