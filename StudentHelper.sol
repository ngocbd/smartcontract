/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StudentHelper at 0x04a5122698adf47ae0cdd0a10274742797684d44
*/
pragma solidity ^0.4.23;
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
    constructor() public {
        owner = msg.sender;
    }

  /**
   * @dev Throws if called by any account other than the owner.
   */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
/**
 * @title SafeMath32
 * @dev SafeMath library implemented for uint32
 */
library SafeMath32 {

    function mul(uint32 a, uint32 b) internal pure returns (uint32) {
        if (a == 0) {
            return 0;
       }
        uint32 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint32 a, uint32 b) internal pure returns (uint32) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint32 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint32 a, uint32 b) internal pure returns (uint32) {
        assert(b <= a);
        return a - b;
    }

    function add(uint32 a, uint32 b) internal pure returns (uint32) {
        uint32 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 * @title SafeMath16
 * @dev SafeMath library implemented for uint16
 */
library SafeMath16 {

    function mul(uint16 a, uint16 b) internal pure returns (uint16) {
        if (a == 0) {
            return 0;
        }
        uint16 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint16 a, uint16 b) internal pure returns (uint16) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint16 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint16 a, uint16 b) internal pure returns (uint16) {
        assert(b <= a);
        return a - b;
    }

    function add(uint16 a, uint16 b) internal pure returns (uint16) {
        uint16 c = a + b;
        assert(c >= a);
        return c;
    }
}
contract StudentFactory is Ownable{

    struct Student{
        string name;// ??
        string nation;// ??
        string id;// ???
        uint32 birth;// ??
        bytes1 gender;// ??
    } 
    
    struct Undergraduate{
        string studentId; // ???
        string school;// ?? 
        string major;// ??
        uint8 length;// ??
        uint8 eduType;// ????
        uint8 eduForm;// ????
        uint8 class;// ??
        uint8 level;// ??(?/?/?/?)
        uint8 state;// ????
        uint32 admissionDate;// ????
        uint32 departureDate;// ????
    }

    struct Master{
        string studentId; // ???
        string school;// ?? 
        string major;// ??
        uint8 length;// ??
        uint8 eduType;// ????
        uint8 eduForm;// ????
        uint8 class;// ??
        uint8 level;// ??(?/?/?/?)
        uint8 state;// ????
        uint32 admissionDate;// ????
        uint32 departureDate;// ????
    }

    struct Doctor{
        string studentId; // ???
        string school;// ?? 
        string major;// ??
        uint8 length;// ??
        uint8 eduType;// ????
        uint8 eduForm;// ????
        uint8 class;// ??
        uint8 level;// ??(?/?/?/?)
        uint8 state;// ????
        uint32 admissionDate;// ????
        uint32 departureDate;// ????
    }

    struct CET4{
        uint32 time; //????2017?12?
        uint32 grade;// ??
    }

    struct CET6{
        uint32 time; //????2017?12?
        uint32 grade;// ??
    }

    Student[] students;// ????
    CET4[] CET4List; // ??????
    CET6[] CET6List; // ??????
    mapping (address=>Student) public addrToStudent;// ????????
    mapping (uint=>address) internal CET4IndexToAddr; // ????????????
    mapping (uint=>address) internal CET6IndexToAddr; // ????????????
    mapping (address=>uint) public addrCET4Count; //???????????
    mapping (address=>uint) public addrCET6Count; //???????????
    mapping (address=>Undergraduate) public addrToUndergaduate;// ??????????
    mapping (address=>Master) public addrToMaster;// ??????????
    mapping (address=>Doctor) public addrToDoctor;// ??????????
   
    // ?????????????modifier
    modifier availableIdOf(string _id) {
        require(_isIdExisted(_id));
        _;
    }

    // ???????????
    function _isIdExisted(string _id) private view returns(bool){
        for(uint i = 0;i<students.length;i++){
            if(keccak256(students[i].id)==keccak256(_id)){
                return false;
            }
        }
        return true;
    }

    // ????
    function createStudent(string _name,string _nation,string _id,uint32 _birth,bytes1 _gender) public availableIdOf(_id){
        Student memory student = Student(_name,_nation,_id,_birth,_gender);
        addrToStudent[msg.sender] = student;
        students.push(student);
    }
}
contract StudentHelper is StudentFactory{
    using SafeMath for uint;
    // ???????????????
    function addUndergraduateTo(address _addr,string _studentId,string _school,string _major,uint8 _length,uint8 _eduType,uint8 _eduForm,uint8 _class,uint8 _level,uint8 _state,uint32 _admissionDate,uint32 _departureDate) 
    public onlyOwner{
        addrToUndergaduate[_addr] = Undergraduate(_studentId,_school,_major,_length,_eduType,_eduForm,_class,_level,_state,_admissionDate,_departureDate);
    }

    // ???????????????
    function addMasterTo(address _addr,string _studentId,string _school,string _major,uint8 _length,uint8 _eduType,uint8 _eduForm,uint8 _class,uint8 _level,uint8 _state,uint32 _admissionDate,uint32 _departureDate) 
    public onlyOwner{
        addrToMaster[_addr] = Master(_studentId,_school,_major,_length,_eduType,_eduForm,_class,_level,_state,_admissionDate,_departureDate);
    }

    // ???????????????
    function addDoctorTo(address _addr,string _studentId,string _school,string _major,uint8 _length,uint8 _eduType,uint8 _eduForm,uint8 _class,uint8 _level,uint8 _state,uint32 _admissionDate,uint32 _departureDate) 
    public onlyOwner{
        addrToDoctor[_addr] = Doctor(_studentId,_school,_major,_length,_eduType,_eduForm,_class,_level,_state,_admissionDate,_departureDate);
    }

    // ?????????????
    function addCET4To(address _addr,uint32 _time,uint32 _grade) public onlyOwner{
        uint index = CET4List.push(CET4(_time,_grade))-1;
        CET4IndexToAddr[index] = _addr;
        addrCET4Count[_addr]++;
    }

    // ?????????????
    function addCET6To(address _addr,uint32 _time,uint32 _grade) public onlyOwner{
        uint index = CET6List.push(CET6(_time,_grade))-1;
        CET6IndexToAddr[index] = _addr;
        addrCET6Count[_addr]++;
    }

    // ???????????
    function getCET4ByAddr(address _addr) view public returns (uint32[],uint32[]) {
        uint32[] memory timeList = new uint32[](addrCET4Count[_addr]); 
        uint32[] memory gradeList = new uint32[](addrCET4Count[_addr]);
        uint counter = 0;    
        for (uint i = 0; i < CET4List.length; i++) {
            if(CET4IndexToAddr[i]==_addr){
                timeList[counter] = CET4List[i].time;
                gradeList[counter] = CET4List[i].grade;
                counter++;
            }
        }
        return(timeList,gradeList);
    }

    // ???????????
    function getCET6ByAddr(address _addr) view public returns (uint32[],uint32[]) {
        uint32[] memory timeList = new uint32[](addrCET6Count[_addr]); 
        uint32[] memory gradeList = new uint32[](addrCET6Count[_addr]);
        uint counter = 0;    
        for (uint i = 0; i < CET6List.length; i++) {
            if(CET6IndexToAddr[i]==_addr){
                timeList[counter] = CET6List[i].time;
                gradeList[counter] = CET6List[i].grade;
                counter++;
            }
        }
        return(timeList,gradeList);
    }
}