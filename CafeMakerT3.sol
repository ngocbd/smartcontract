/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CafeMakerT3 at 0x68ed5f7482307dcd325cd92d48b52b0a2e2a7069
*/
contract CafeMakerT3 {

	//CafeMaker Counters..
	uint public payed;
	uint public delivered;

	uint public PricePerCafe = 50000000000000000; //0.05 eth
	address public Owner = msg.sender;

//	function CafeMaker(){
//		PricePerCafe = 50000000000000000;
//		Owner = msg.sender; //"0x43e7948F4A71da12f6b79a82bf1C478E9eDB062a";
//	}

	function GetFreeCnt() returns (uint cnt) {
		return payed - delivered;
	}

	function CafeDelivered(){
		delivered += 1;
	}


	function CollectMoney(uint amount){
       if (!Owner.send(amount))
            throw;
		
	}


	//ProcessIncomingPayment
    function () {

		uint addedcafe = msg.value / PricePerCafe;
		payed += addedcafe;

    }
}