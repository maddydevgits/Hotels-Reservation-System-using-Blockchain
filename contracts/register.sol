// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract register {

  address admin;
  uint password;
  
  address[] _customers;
  string[] _names;
  string[] _emails;
  string[] _mobiles;
  uint[] _passwords;

  mapping(address=>bool) users;

  constructor() public {
    admin=msg.sender;
    password=1234;
  }

  function loginadmin(address a,uint p) public view returns(bool) {

    if(a==admin && p==password){
      return true;
    }
    else{
      return false;
    }
  }

  function registeruser(address customer,string memory name,string memory email,string memory mobile,uint password1) public {

      require(!users[customer]);

      users[customer]=true;
      _customers.push(customer);
      _names.push(name);
      _emails.push(email);
      _mobiles.push(mobile);
      _passwords.push(password1);
  }

  function viewusers() public view returns(address[] memory,string[] memory,string[] memory,string[] memory,uint[] memory){
    return(_customers,_names,_emails,_mobiles,_passwords);
  }

  function loginuser(address username,uint password2) public view returns(bool){

    uint i;

    for(i=0;i<_customers.length;i++){
      if(username==_customers[i] && _passwords[i]==password2){
        return true;
      }
    }
    return false;
  }
}
