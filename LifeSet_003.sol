/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LifeSet_003 at 0x43f5cc633dc1ac17acac2add3d3d5f2d9cfcdf22
*/
contract LifeSet_003 {
  uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  uint256 public lifeCoin;
  
  uint256 public A;
  uint256 public B;
  uint256 public C;

  function LifeSet_003() public {
    A = (block.number-1);
	B = uint256(block.blockhash(block.number-1));    
	lifeCoin = (B / FACTOR);
  }	
	
    function	getA	()	public	constant	returns	(	uint256	)	{
        return	A ;						
	}	    
	
    function	getB	()	public	constant	returns	(	uint256	)	{
        return	B ;						
	}

    function	getLifeCoin	()	public	constant	returns	(	uint256	)	{
        return	lifeCoin ;						
    }
}