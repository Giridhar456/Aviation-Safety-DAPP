pragma solidity^0.4.19;
//import "browser/pilotstudentregister.sol";
contract trainingdetails{
 struct trainingdata{
    string flightmodelname;
    uint trainingstartingtime;
    uint trainingendingtime;
    uint fromkm;
    uint tokm;
    }
//mapping(address =>trainingdata)TD;
mapping(string =>trainingdata)pilot;
 string [] DATE;
  function InsertTrainingStartDetails(string DATE,address _address,string FlightModelName,uint FromKm){
        var TAD=pilot[DATE];
        TAD.flightmodelname = FlightModelName;
        TAD.trainingstartingtime = block.timestamp;
        TAD.fromkm = FromKm;
      //  DATE.push(Date) -1;
    }
       
    function InsertTrainingEndDetails(string DATE,uint ToKm){
        var TAD=pilot[DATE];
        TAD.trainingendingtime = block.timestamp;
        TAD.tokm = ToKm;
    }
    function GetTrainingDetails(string DATE) view public returns(string,uint,uint){
        return(pilot[DATE].flightmodelname,pilot[DATE].tokm-pilot[DATE].fromkm,pilot[DATE].trainingendingtime-pilot[DATE].trainingstartingtime);
    }
}
