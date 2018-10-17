/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract KyberRegisterWallet at 0xa3f1f577b6dd7aaf3fde5cc12fa99c4406f7c800
*/
pragma solidity 0.4.18;

// File: contracts/wrapperContracts/KyberRegisterWallet.sol

interface BurnerWrapperProxy {
    function registerWallet(address wallet) public;
}


contract KyberRegisterWallet {

    BurnerWrapperProxy public feeBurnerWrapperProxyContract;

    function KyberRegisterWallet(BurnerWrapperProxy feeBurnerWrapperProxy) public {
        require(feeBurnerWrapperProxy != address(0));

        feeBurnerWrapperProxyContract = feeBurnerWrapperProxy;
    }

    function registerWallet(address wallet) public {
        feeBurnerWrapperProxyContract.registerWallet(wallet);
    }
}