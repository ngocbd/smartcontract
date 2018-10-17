/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SupeciesToken at 0x08478c2d473ea6402a70e2022f7a0a5f46ca4711
*/
pragma solidity ^0.4.4;
contract Token {

    /// @return ??token????
    function totalSupply() constant returns (uint256 supply) {}

    /// @param _owner ???????token??
    /// @return The balance ????
    function balanceOf(address _owner) constant returns (uint256 balance) {}

    /// @notice msg.sender????????? _value??????? token ? _to?????  
    /// @param _to ??????
    /// @param _value ??token???
    /// @return ????
    function transfer(address _to, uint256 _value) returns (bool success) {}

    /// @notice ??? ?? _value??????? token ? _to?????  
    /// @param _from ??????
    /// @param _to ??????
    /// @param _value ?????
    /// @return ????
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    /// @notice ??? ?? ???????????token
    /// @param _spender ????token???
    /// @param _value ??token???
    /// @return ????
    function approve(address _spender, uint256 _value) returns (bool success) {}

    /// @param _owner ??token???
    /// @param _spender ????token???
    /// @return ??????token???
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    /// ??Token??
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    /// ????
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
contract StandardToken is Token {

    function transfer(address _to, uint256 _value) returns (bool success) {
        //??token???????(2^256 - 1)
        //??????????????????????token?????????????????? if ??
        //if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        //????????????????????????
        //if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
}
contract SupeciesToken is StandardToken {

    function () {
        //if ether is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */

    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    string public name;                   //token??: SupeciesToken 
    uint8 public decimals;                //???
    string public symbol;                 //??
    string public version = 'H0.1';       //???

    function SupeciesToken(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        balances[msg.sender] = _initialAmount;               // ?????????????
        totalSupply = _initialAmount;                        // ???
        name = _tokenName;                                   // token??
        decimals = _decimalUnits;                            // token???
        symbol = _tokenSymbol;                               // token??
    }

    /* ?????????? */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        //?????????? receiveApprovalcall ?? ?????????????????????
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //?????????????????vanilla approve?
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}