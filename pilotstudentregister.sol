pragma solidity^0.4.24;
contract studentpilot{
    struct studentregisterdata{
    string studentname;
    string studentqualification;
    string studentcontactaddress;
    uint studentcontactnumber;
    string studentemailid;
    string studentinstitutename;
    address accountaddress;
    }
    address _address;
    event StudentEvent(
    address _address,
    string studentname,
    string studentqualification,
    string studentcontactaddress,
    uint studentcontactnumber,
    string studentemailid,
    string studentinstitutename
   // address accountaddress
        );
    mapping (address => studentregisterdata)Studentdata;
    address[] public studentdata;
    modifier ifowner(){
        if(_address != msg.sender){
            throw;
        }
                _;
    }
    function Insertdetails(address _address,string memory StudentName,string memory StudentQualification,string memory StudentContactAddress,uint StudentContactNumber,string memory StudentEmailId,string memory studentInstituteName) public{
        Studentdata[_address].accountaddress= msg.sender;
        var StudentDetails = Studentdata[_address];
        StudentDetails.studentname= StudentName;
        StudentDetails.studentqualification= StudentQualification;
        StudentDetails.studentcontactaddress= StudentContactAddress;
            StudentDetails.studentcontactnumber= StudentContactNumber;
        StudentDetails.studentemailid = StudentEmailId;
        StudentDetails.studentinstitutename= studentInstituteName;
        studentdata.push(_address) -1;
        emit StudentEvent(_address,StudentName,StudentQualification,StudentContactAddress,StudentContactNumber,StudentEmailId,studentInstituteName);
    }
      function getdatas() view public returns(address[]) {
        return studentdata;
    }
    function GetStudentdata(address _address) view public returns (string memory,string memory,string memory,uint,string memory,string memory) {
       return(Studentdata[_address].studentname,Studentdata[_address].studentqualification,Studentdata[_address].studentcontactaddress,Studentdata[_address].studentcontactnumber,Studentdata[_address].studentemailid,Studentdata[_address].studentinstitutename);
    }
    function UpdateStudentData(address _address,string memory StudentContactAddress,uint StudentContactNumber,string memory StudentEmailId) public{

        var StudentDetails = Studentdata[_address];
        StudentDetails.studentcontactaddress= StudentContactAddress;
        StudentDetails.studentcontactnumber= StudentContactNumber;
        StudentDetails.studentemailid = StudentEmailId;
    }
    
}   
