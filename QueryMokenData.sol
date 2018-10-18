/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract QueryMokenData at 0x8402fa42e89b0477ee4222222beecfde98145a32
*/
pragma solidity 0.4.24;
pragma experimental "v0.5.0";
/******************************************************************************\
* Author: Nick Mudge, nick@mokens.io
* Mokens
* Copyright (c) 2018
*
* Functions for querying moken information.
/******************************************************************************/
///////////////////////////////////////////////////////////////////////////////////
//Storage contracts
////////////
//Some delegate contracts are listed with storage contracts they inherit.
///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
//Mokens
///////////////////////////////////////////////////////////////////////////////////
contract Storage0 {
    // funcId => delegate contract
    mapping(bytes4 => address) internal delegates;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenUpdates
//MokenOwner
//QueryMokenDelegates
///////////////////////////////////////////////////////////////////////////////////
contract Storage1 is Storage0 {
    address internal contractOwner;
    bytes[] internal funcSignatures;
    // signature => index+1
    mapping(bytes => uint256) internal funcSignatureToIndex;
}
///////////////////////////////////////////////////////////////////////////////////
//MokensSupportsInterfaces
///////////////////////////////////////////////////////////////////////////////////
contract Storage2 is Storage1 {
    mapping(bytes4 => bool) internal supportedInterfaces;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenRootOwnerOf
//MokenERC721Metadata
///////////////////////////////////////////////////////////////////////////////////
contract Storage3 is Storage2 {
    struct Moken {
        string name;
        uint256 data;
        uint256 parentTokenId;
    }
    //tokenId => moken
    mapping(uint256 => Moken) internal mokens;
    uint256 internal mokensLength;
    // child address => child tokenId => tokenId+1
    mapping(address => mapping(uint256 => uint256)) internal childTokenOwner;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenERC721Enumerable
//MokenLinkHash
///////////////////////////////////////////////////////////////////////////////////
contract Storage4 is Storage3 {
    // root token owner address => (tokenId => approved address)
    mapping(address => mapping(uint256 => address)) internal rootOwnerAndTokenIdToApprovedAddress;
    // token owner => (operator address => bool)
    mapping(address => mapping(address => bool)) internal tokenOwnerToOperators;
    // Mapping from owner to list of owned token IDs
    mapping(address => uint32[]) internal ownedTokens;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenERC998ERC721TopDown
//MokenERC998ERC721TopDownBatch
//MokenERC721
//MokenERC721Batch
///////////////////////////////////////////////////////////////////////////////////
contract Storage5 is Storage4 {
    // tokenId => (child address => array of child tokens)
    mapping(uint256 => mapping(address => uint256[])) internal childTokens;
    // tokenId => (child address => (child token => child index)
    mapping(uint256 => mapping(address => mapping(uint256 => uint256))) internal childTokenIndex;
    // tokenId => (child address => contract index)
    mapping(uint256 => mapping(address => uint256)) internal childContractIndex;
    // tokenId => child contract
    mapping(uint256 => address[]) internal childContracts;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenERC998ERC20TopDown
//MokenStateChange
///////////////////////////////////////////////////////////////////////////////////
contract Storage6 is Storage5 {
    // tokenId => token contract
    mapping(uint256 => address[]) internal erc20Contracts;
    // tokenId => (token contract => token contract index)
    mapping(uint256 => mapping(address => uint256)) erc20ContractIndex;
    // tokenId => (token contract => balance)
    mapping(uint256 => mapping(address => uint256)) internal erc20Balances;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenERC998ERC721BottomUp
//MokenERC998ERC721BottomUpBatch
///////////////////////////////////////////////////////////////////////////////////
contract Storage7 is Storage6 {
    // parent address => (parent tokenId => array of child tokenIds)
    mapping(address => mapping(uint256 => uint32[])) internal parentToChildTokenIds;
    // tokenId => position in childTokens array
    mapping(uint256 => uint256) internal tokenIdToChildTokenIdsIndex;
}
///////////////////////////////////////////////////////////////////////////////////
//MokenMinting
//MokenMintContractManagement
//MokenEras
//QueryMokenData
///////////////////////////////////////////////////////////////////////////////////
contract Storage8 is Storage7 {
    // index => era
    mapping(uint256 => bytes32) internal eras;
    uint256 internal eraLength;
    // era => index+1
    mapping(bytes32 => uint256) internal eraIndex;
    uint256 internal mintPriceOffset; // = 0 szabo;
    uint256 internal mintStepPrice; // = 500 szabo;
    uint256 internal mintPriceBuffer; // = 5000 szabo;
    address[] internal mintContracts;
    mapping(address => uint256) internal mintContractIndex;
    //moken name => tokenId+1
    mapping(string => uint256) internal tokenByName_;
}

contract QueryMokenData is Storage8 {

    uint256 constant UINT16_MASK = 0x000000000000000000000000000000000000000000000000000000000000ffff;

    function validateAndLower(string _s) internal pure returns (string mokenName) {
        assembly {
        // get length of _s
            let len := mload(_s)
        // get position of _s
            let p := add(_s, 0x20)
        // _s cannot be 0 characters
            if eq(len, 0) {
                revert(0, 0)
            }
        // _s cannot be more than 100 characters
            if gt(len, 100) {
                revert(0, 0)
            }
        // get first character
            let b := byte(0, mload(add(_s, 0x20)))
        // first character cannot be whitespace/unprintable
            if lt(b, 0x21) {
                revert(0, 0)
            }
        // get last character
            b := byte(0, mload(add(p, sub(len, 1))))
        // last character cannot be whitespace/unprintable
            if lt(b, 0x21) {
                revert(0, 0)
            }
        // loop through _s and lowercase uppercase characters
            for {let end := add(p, len)}
            lt(p, end)
            {p := add(p, 1)}
            {
                b := byte(0, mload(p))
                if lt(b, 0x5b) {
                    if gt(b, 0x40) {
                        mstore8(p, add(b, 32))
                    }
                }
            }
        }
        return _s;
    }

    function mokenNameExists(string _mokenName) external view returns (bool) {
        return tokenByName_[validateAndLower(_mokenName)] != 0;
    }

    function mokenId(string _mokenName) external view returns (uint256 tokenId) {
        tokenId = tokenByName_[validateAndLower(_mokenName)];
        require(tokenId != 0, "No moken exists with this name.");
        return tokenId - 1;
    }

    function mokenData(uint256 _tokenId) external view returns (bytes32 data) {
        data = bytes32(mokens[_tokenId].data);
        require(data != 0, "The tokenId does not exist.");
        return data;
    }

    function eraFromMokenData(bytes32 _data) public view returns (bytes32 era) {
        return eras[uint256(_data) >> 176 & UINT16_MASK];
    }

    function eraFromMokenData(uint256 _data) public view returns (bytes32 era) {
        return eras[_data >> 176 & UINT16_MASK];
    }

    function mokenEra(uint256 _tokenId) external view returns (bytes32 era) {
        uint256 data = mokens[_tokenId].data;
        require(data != 0, "The tokenId does not exist.");
        return eraFromMokenData(data);
    }

    function moken(uint256 _tokenId) external view
    returns (string memory mokenName, bytes32 era, bytes32 data, address tokenOwner) {
        data = bytes32(mokens[_tokenId].data);
        require(data != 0, "The tokenId does not exist.");
        return (
        mokens[_tokenId].name,
        eraFromMokenData(data),
        data,
        address(data)
        );
    }

    function mokenBytes32(uint256 _tokenId) external view
    returns (bytes32 mokenNameBytes32, bytes32 era, bytes32 data, address tokenOwner) {
        data = bytes32(mokens[_tokenId].data);
        require(data != 0, "The tokenId does not exist.");
        bytes memory mokenNameBytes = bytes(mokens[_tokenId].name);
        uint256 mokenNameLength = mokenNameBytes.length;
        require(mokenNameLength != 0, "The tokenId does not exist.");
        assembly {
            mokenNameBytes32 := mload(add(mokenNameBytes, 32))
        }
        uint256 shift = ((32-mokenNameLength)*8);
        return (
        (mokenNameBytes32 >> shift) << shift,
        eraFromMokenData(data),
        data,
        address(data)
        );
    }

    function mokenNoName(uint256 _tokenId) external view
    returns (bytes32 era, bytes32 data, address tokenOwner) {
        data = bytes32(mokens[_tokenId].data);
        require(data != 0, "The tokenId does not exist.");
        return (
        eraFromMokenData(data),
        data,
        address(data)
        );
    }

    function mokenName(uint256 _tokenId) external view returns (string memory mokenName_) {
        mokenName_ = mokens[_tokenId].name;
        require(bytes(mokenName_).length != 0, "The tokenId does not exist.");
        return mokenName_;
    }

    function mokenNameBytes32(uint256 _tokenId) external view returns (bytes32 mokenNameBytes32_) {
        bytes memory mokenNameBytes = bytes(mokens[_tokenId].name);
        uint256 mokenNameLength = mokenNameBytes.length;
        require(mokenNameLength != 0, "The tokenId does not exist.");
        assembly {
            mokenNameBytes32_ := mload(add(mokenNameBytes, 32))
        }
        uint256 shift = ((32-mokenNameLength)*8);
        return (mokenNameBytes32_ >> shift) << shift;
    }
}