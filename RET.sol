/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RET at 0x20a2a8a6b99692616D29C3a10930b39843C3F48c
*/
pragma solidity ^0.4.18;

contract Blockeds {
  mapping (address => bool) blocked;

  event Blocked(address _addr);
  event Unblocked(address _addr);

  function blockAddress(address _addr) public {
    require(!blocked[_addr]);
    blocked[_addr] = true;

    Blocked(_addr);
  }

  function unblockAddress(address _addr) public {
    require(blocked[_addr]);
    blocked[_addr] = false;

    Unblocked(_addr);
  }
}

/*
    ??? 2016, Jordi Baylina

    ? ????? ?? ????????.
    ? ????? Free Soft ware Foundation??
    ???? GNU General Public License?
    ??? ?? ????? ?? 3??(?? ????)
    ?? ???? ??? ? ?? ??? ? ????.

    ? ????? ??? ?? ???? ?????,
    ????? ?? ??? ?? ???? ???
    ??? ?? ?? ?? ?? ?????.
    ??? ??? GNU General Public License? ??????.

    ? ????? ?? GNU General Public License ??? ??????.
    ??? ???, ?? : <http://www.gnu.org/licenses/>
 */

/*
 * @title MiniMeToken
 * @author Jordi Baylina
 * @dev ? ?? ??? ??? ? ??? ??? ???? ????.
 *      ??? ???? ??? ???? DAO ? DApps? ?? ??? ??? ?? ?? ??? ??? ???? ?????? ? ????.
 * @dev ERC20? ????? ?? ???? ???????.
*/
contract Controlled {
    // ????? ??? ? ?? ?????? ??? ??? ? ?? ??? ?????.
    modifier onlyController { require(msg.sender == controller); _; }

    address public controller;

    function Controlled() public { controller = msg.sender;}

    //                ?? ???
    // _newController ??? ???
    function changeController(address _newController) public onlyController {
        controller = _newController;
    }
}



// ?? ???? ???? ??? ??? ???? ???.
contract TokenController {
    // @notice `_owner`? ????? MiniMeToken ??? ?? ? ?????.
    // @param   _owner ??? ???? ?? ????? ?? ??
    // @return         ????? ?? ???? ??? true, ?? ??? false
    function proxyPayment(address _owner) public payable returns(bool);

    // @notice         ????? ?? ??? ?? ????.
    //                 ??? ?? ???? ????
    // @param _from    ??? ??
    // @param _to      ?? ???
    // @param _amount  ?? ??
    // @return         ????? ??? ???? ?? ?? ??
    function onTransfer(address _from, address _to, uint _amount) public returns(bool);

    // @notice                     ????? ?? ??? ???, ??? ?? ????? ????? ???.
    // @param _owner `approve ()`  ? ???? ??.
    // @param _spender `approve()` ???? ???
    // @param _amount `approve ()` ??? ?
    // @return                     ????? ??? ???? ?? ?? ??
    function onApprove(address _owner, address _spender, uint _amount) public
        returns(bool);
}

contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 _amount, address _token, bytes _data) public;
}

// ?? ?? ??? ?? ????? ???? ???? msg.sender???
// ? ??? ?? ?? ???? ??? ?? ????,
// Giveth? "Campaign"? ?????.
contract MiniMeToken is Controlled {
    string public name;                // ?? ?? : EX DigixDAO token
    uint8 public decimals;             // ?? ??? ?? ???
    string public symbol;              // ??? EX : e.g. REP
    string public version = 'MMT_0.2'; // ?? ?? ??

    // @dev `Checkpoint` ?? ??? ??? ?? ???? ????,
    //                    ??? ?? ??? ????? ?? ??? ?????.
    struct  Checkpoint {

        // `fromBlock` ?? ??? ?? ?????.
        uint128 fromBlock;

        // `value` ?? ?? ??? ?? ????.
        uint128 value;
    }

    // `parentToken` ? ??? ???? ?? ?? ? ?? ?????.
    //               ???? ?? ??? ?? 0x0? ???.
    MiniMeToken public parentToken;

    // `parentSnapShotBlock` ?? ??? ?? ???,
    //                       ?? ??? ?? ??? ???? ? ???
    uint public parentSnapShotBlock;

    // `creationBlock` ?? ??? ??? ?? ?????.
    uint public creationBlock;

    // `balances` ? ???? ??? ??? ? ?? ??? ???
    //            ?? ??? ?? ???? ??? ? ??? ??? ???? ????.
    mapping (address => Checkpoint[]) balances;

    // `allowed` ?? ERC20 ????? ?? ?? ?? ??? ?????.
    mapping (address => mapping (address => uint256)) allowed;

    // ??? `totalSupply` ??? ?????.
    Checkpoint[] totalSupplyHistory;

    // ??? ?? ???? ??? ???? ??? ???.
    bool public transfersEnabled;

    // ? ?? ??? ??? ? ?? ? ???
    MiniMeTokenFactory public tokenFactory;

    /*
     * ???
     */
    // @notice MiniMeToken? ???? ???
    // @param _tokenFactory MiniMeTokenFactory ??? ??
    //                               ?? ?? ??? ???? MiniMeTokenFactory ??? ??,
    //                               ?? ?? ???? ???????.
    // @param _parentToken           ?? ??? ParentTokerut ?? (? ??? ?? 0x0?? ???)
    // @param _parentSnapShotBlock   ?? ??? ?? ??? ??? ?? ??? ??(? ??? ?? 0?? ???)
    // @param _tokenName             ? ??? ??
    // @param _decimalUnits          ? ??? ?? ???
    // @param _tokenSymbol           ? ??? ?? ?? ??
    // @param _transfersEnabled true ?? ??? ??? ? ????.
    function MiniMeToken(
        address _tokenFactory,
        address _parentToken,
        uint _parentSnapShotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) public {
        tokenFactory = MiniMeTokenFactory(_tokenFactory);
        name = _tokenName;                                 // ?? ??
        decimals = _decimalUnits;                          // ??? ??
        symbol = _tokenSymbol;                             // ?? ?? (??)
        parentToken = MiniMeToken(_parentToken);
        parentSnapShotBlock = _parentSnapShotBlock;
        transfersEnabled = _transfersEnabled;
        creationBlock = block.number;
    }

    function transfer(address _to, uint256 _amount) public returns (bool success) {
        require(transfersEnabled);
        doTransfer(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _amount
    ) public returns (bool success) {
        if (msg.sender != controller) {
            require(transfersEnabled);

            require(allowed[_from][msg.sender] >= _amount);
            allowed[_from][msg.sender] -= _amount;
        }
        doTransfer(_from, _to, _amount);
        return true;
    }

    function doTransfer(address _from, address _to, uint _amount
    ) internal {

           if (_amount == 0) {
               Transfer(_from, _to, _amount);
               return;
           }

           require(parentSnapShotBlock < block.number);

           require((_to != 0) && (_to != address(this)));

           var previousBalanceFrom = balanceOfAt(_from, block.number);

           require(previousBalanceFrom >= _amount);

           if (isContract(controller)) {
               require(TokenController(controller).onTransfer(_from, _to, _amount));
           }

           updateValueAtNow(balances[_from], previousBalanceFrom - _amount);

           var previousBalanceTo = balanceOfAt(_to, block.number);
           require(previousBalanceTo + _amount >= previousBalanceTo);
           updateValueAtNow(balances[_to], previousBalanceTo + _amount);

           Transfer(_from, _to, _amount);

    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balanceOfAt(_owner, block.number);
    }

    function approve(address _spender, uint256 _amount) public returns (bool success) {
        require(transfersEnabled);

        require((_amount == 0) || (allowed[msg.sender][_spender] == 0));

        // ?? ?? ??? ?? ????? ??
        if (isContract(controller)) {
            require(TokenController(controller).onApprove(msg.sender, _spender, _amount));
        }

        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender
    ) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    function approveAndCall(address _spender, uint256 _amount, bytes _extraData
    ) public returns (bool success) {
        require(approve(_spender, _amount));

        ApproveAndCallFallBack(_spender).receiveApproval(
            msg.sender,
            _amount,
            this,
            _extraData
        );

        return true;
    }

    function totalSupply() public constant returns (uint) {
        return totalSupplyAt(block.number);
    }

    /*
     * ???? ? ?? ?? ? ? ??
     */
    function balanceOfAt(address _owner, uint _blockNumber) public constant
        returns (uint) {

        if ((balances[_owner].length == 0)
            || (balances[_owner][0].fromBlock > _blockNumber)) {
            if (address(parentToken) != 0) {
                return parentToken.balanceOfAt(_owner, min(_blockNumber, parentSnapShotBlock));
            } else {
                // ????? ??.
                return 0;
            }
        } else {
            return getValueAt(balances[_owner], _blockNumber);
        }
    }

    function totalSupplyAt(uint _blockNumber) public constant returns(uint) {
        if ((totalSupplyHistory.length == 0)
            || (totalSupplyHistory[0].fromBlock > _blockNumber)) {
            if (address(parentToken) != 0) {
                return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
            } else {
                return 0;
            }
        } else {
            return getValueAt(totalSupplyHistory, _blockNumber);
        }
    }

    /*
     * ?? ?? ??
     */
    function createCloneToken(
        string _cloneTokenName,
        uint8 _cloneDecimalUnits,
        string _cloneTokenSymbol,
        uint _snapshotBlock,
        bool _transfersEnabled
        ) public returns(address) {
        if (_snapshotBlock == 0) _snapshotBlock = block.number;
        MiniMeToken cloneToken = tokenFactory.createCloneToken(
            this,
            _snapshotBlock,
            _cloneTokenName,
            _cloneDecimalUnits,
            _cloneTokenSymbol,
            _transfersEnabled
            );

        cloneToken.changeController(msg.sender);

        NewCloneToken(address(cloneToken), _snapshotBlock);
        return address(cloneToken);
    }

    /*
     * ?? ?? ? ??
     */
    function generateTokens(address _owner, uint _amount
    ) public onlyController returns (bool) {
        uint curTotalSupply = totalSupply();
        require(curTotalSupply + _amount >= curTotalSupply);
        uint previousBalanceTo = balanceOf(_owner);
        require(previousBalanceTo + _amount >= previousBalanceTo);
        updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
        updateValueAtNow(balances[_owner], previousBalanceTo + _amount);
        Transfer(0, _owner, _amount);
        return true;
    }

    function destroyTokens(address _owner, uint _amount
    ) onlyController public returns (bool) {
        uint curTotalSupply = totalSupply();
        require(curTotalSupply >= _amount);
        uint previousBalanceFrom = balanceOf(_owner);
        require(previousBalanceFrom >= _amount);
        updateValueAtNow(totalSupplyHistory, curTotalSupply - _amount);
        updateValueAtNow(balances[_owner], previousBalanceFrom - _amount);
        Transfer(_owner, 0, _amount);
        return true;
    }

    /*
     * ?? ?? ??
     */
    function enableTransfers(bool _transfersEnabled) public onlyController {
        transfersEnabled = _transfersEnabled;
    }

    /*
     * ?? ? ???? ?? ???? ???? ?? ??? ??
     */
    function getValueAt(Checkpoint[] storage checkpoints, uint _block
    ) constant internal returns (uint) {
        if (checkpoints.length == 0) return 0;

        // ?? ? ?? ??
        if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            return checkpoints[checkpoints.length-1].value;
        if (_block < checkpoints[0].fromBlock) return 0;

        // ??? ?? 2? ??
        uint min = 0;
        uint max = checkpoints.length-1;
        while (max > min) {
            uint mid = (max + min + 1)/ 2;
            if (checkpoints[mid].fromBlock<=_block) {
                min = mid;
            } else {
                max = mid-1;
            }
        }
        return checkpoints[min].value;
    }

    function updateValueAtNow(Checkpoint[] storage checkpoints, uint _value
    ) internal  {
        if ((checkpoints.length == 0)
        || (checkpoints[checkpoints.length -1].fromBlock < block.number)) {
               Checkpoint storage newCheckPoint = checkpoints[ checkpoints.length++ ];
               newCheckPoint.fromBlock =  uint128(block.number);
               newCheckPoint.value = uint128(_value);
           } else {
               Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length-1];
               oldCheckPoint.value = uint128(_value);
           }
    }

    function isContract(address _addr) constant internal returns(bool) {
        uint size;
        if (_addr == 0) return false;
        assembly {
            size := extcodesize(_addr)
        }
        return size>0;
    }

    function min(uint a, uint b) pure internal returns (uint) {
        return a < b ? a : b;
    }

    function () public payable {
        require(isContract(controller));
        require(TokenController(controller).proxyPayment.value(msg.value)(msg.sender));
    }

    /*
     * ?? ??
     */
    function claimTokens(address _token) public onlyController {
        if (_token == 0x0) {
            controller.transfer(this.balance);
            return;
        }

        MiniMeToken token = MiniMeToken(_token);
        uint balance = token.balanceOf(this);
        token.transfer(controller, balance);
        ClaimedTokens(_token, controller, balance);
    }

    /*
     * ???
     */
    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
    event Transfer(address indexed _from, address indexed _to, uint256 _amount);
    event NewCloneToken(address indexed _cloneToken, uint _snapshotBlock);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _amount
        );
}

/*
 * MiniMeTokenFactory
 */
// ? ??? ???? ?? ??? ???? ? ?????.
contract MiniMeTokenFactory {
    //                      ??? ???? ??? ??? ??? DApp? ????????.
    //  msg.sender          ? ? ?? ??? ????????.
    // _parentToken         ?? ? ??? ??
    // _snapshotBlock       ?? ?? ??
    //                      ?? ??? ?? ?? ??
    // _tokenName           ? ??? ??
    // @param _decimalUnits ? ??? ?? ???
    // @param _tokenSymbol  ? ??? ?? ?? ??
    // @param _transfersEnabled true ?? ??? ??? ? ????.
    // @return              ? ?? ??? ??
    function createCloneToken(
        address _parentToken,
        uint _snapshotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) public returns (MiniMeToken) {
        MiniMeToken newToken = new MiniMeToken(
            this,
            _parentToken,
            _snapshotBlock,
            _tokenName,
            _decimalUnits,
            _tokenSymbol,
            _transfersEnabled
            );

        newToken.changeController(msg.sender);
        return newToken;
    }
}

/**
 * @title RET
 * @dev RET? MiniMeToken? ???? ERC20 ?? ?????.
 */
contract RET is MiniMeToken, Blockeds {
  bool public sudoEnabled = true;

  modifier onlySudoEnabled() {
    require(sudoEnabled);
    _;
  }

  modifier onlyNotBlocked(address _addr) {
    require(!blocked[_addr]);
    _;
  }

  event SudoEnabled(bool _sudoEnabled);

  function RET(address _tokenFactory) MiniMeToken(
    _tokenFactory,
    0x0,                  // ?? ?? ??
    0,                    // ??? ?? ? ?? ?? ??
    "Rapide Token",      // ?? ??
    18,                   // ???
    "RAP",                // ??(??)
    false                 // ?? ??
  ) public {}

  function transfer(address _to, uint256 _amount) public onlyNotBlocked(msg.sender) returns (bool success) {
    return super.transfer(_to, _amount);
  }

  function transferFrom(address _from, address _to, uint256 _amount) public onlyNotBlocked(_from) returns (bool success) {
    return super.transferFrom(_from, _to, _amount);
  }

  // ??? 4? ??? 'sudorsabled(?? ???)'?? ??????.
  // ALL : 3 ?? sudo ??
  function generateTokens(address _owner, uint _amount) public onlyController onlySudoEnabled returns (bool) {
    return super.generateTokens(_owner, _amount);
  }

  function destroyTokens(address _owner, uint _amount) public onlyController onlySudoEnabled returns (bool) {
    return super.destroyTokens(_owner, _amount);
  }

  function blockAddress(address _addr) public onlyController onlySudoEnabled {
    super.blockAddress(_addr);
  }

  function unblockAddress(address _addr) public onlyController onlySudoEnabled {
    super.unblockAddress(_addr);
  }

  function enableSudo(bool _sudoEnabled) public onlyController {
    sudoEnabled = _sudoEnabled;
    SudoEnabled(_sudoEnabled);
  }

  // byList ??
  function generateTokensByList(address[] _owners, uint[] _amounts) public onlyController onlySudoEnabled returns (bool) {
    require(_owners.length == _amounts.length);

    for(uint i = 0; i < _owners.length; i++) {
      generateTokens(_owners[i], _amounts[i]);
    }

    return true;
  }
}