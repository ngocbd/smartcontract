/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthermiumAffiliates at 0x7f373b93464d093671469be3e4f06a06c3c3a7ca
*/
pragma solidity ^0.4.19;

contract EthermiumAffiliates {
	mapping(address => address[]) public referrals; // mapping of affiliate address to referral addresses
	mapping(address => address) public affiliates; // mapping of referrals addresses to affiliate addresses
	mapping(address => bool) public admins; // mapping of admin accounts
	string[] public affiliateList;
	address public owner;

	event New(address affiliate, address referral);

	modifier onlyOwner {
		assert(msg.sender == owner);
		_;
	}

	modifier onlyAdmin {
	    assert(msg.sender == owner || admins[msg.sender]);
	    _;
	}

  	function setOwner(address newOwner) onlyOwner {
	    owner = newOwner;
	}

	function setAdmin(address admin, bool isAdmin) public onlyOwner {
    	admins[admin] = isAdmin;
  	}

	function EthermiumAffiliates (address owner_)
	{
		owner = owner_;
	}

	function assignReferral (address affiliate, address referral) public onlyAdmin returns (bool)
	{
		if (affiliates[referral] != address(0)) return false;
		referrals[affiliate].push(referral);
		affiliates[referral] = affiliate;
		New(affiliate, referral);
		return true;
	}
	

	function getAffiliateCount() returns (uint)
	{
		return affiliateList.length;
	}

	function getAffiliate(address refferal) public returns (address)
	{
		return affiliates[refferal];
	}

	function getReferrals(address affiliate) public returns (address[])
	{
		return referrals[affiliate];
	}
}