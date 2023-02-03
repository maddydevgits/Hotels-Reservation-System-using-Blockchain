// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract rooms {

  uint reqcount=0;
  address[] _customers;
  string[] _aadhars;
  string[] _city;
  uint[] _noofrooms;
  uint[] _noofdays;
  string[] _dates;
  string[] _noofadults;
  uint[][] _roomids;
  uint[] _roomreq;

  uint totalrooms=10;
  uint[] status=[0,0,0,0,0,0,0,0,0,0]; 
  
  function roomrequest(address customer,string memory aadhar,string memory city,uint noofrooms,uint noofdays,string memory date,string memory noofadults) public{

    reqcount+=1;
    _roomreq.push(reqcount);
    _customers.push(customer);
    _aadhars.push(aadhar);
    _city.push(city);
    _noofrooms.push(noofrooms);
    _noofdays.push(noofdays);
    _dates.push(date);
    _noofadults.push(noofadults);
    _roomids.push([0]);
  } 

  function viewrequests() public view returns(uint[] memory,address[] memory,string[] memory,string[] memory,uint[] memory,uint[] memory,string[] memory,string[] memory,uint[][] memory){
    return(_roomreq,_customers,_aadhars,_city,_noofrooms,_noofdays,_dates,_noofadults,_roomids);
  }

  function allocateroom(uint roomreq,uint[] memory id) public{
    uint i;
    uint j;

    for(i=0;i<_roomreq.length;i++) {
      if(roomreq==_roomreq[i]) {
        _roomids[i]=id;
      }
    }

    for(j=0;j<id.length;j++){
      status[id[j]-1]=1;  
    }
  }

  function viewroomstatus() public view returns(uint[] memory){
    return(status);
  }

  function vacateroom(uint roomreq) public{
    uint i;
    uint j;
    uint[] memory id;

    for(i=0;i<_roomreq.length;i++){
      if(roomreq==_roomreq[i]){
          id=_roomids[i];
          _roomids[i]=[100];
      }
    }
    for(j=0;j<id.length;j++){
      status[id[j]-1]=0;
    }
  }
}
