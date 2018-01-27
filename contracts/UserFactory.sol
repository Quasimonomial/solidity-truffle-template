pragma solidity ^0.4.8;
import "./User.sol";

contract UserFactory {

  struct Data {
    address uid;
    address factory;
    string name;
    string surname;
    string interests;
    string about;
  }
  // index of created contracts
  mapping (address => Data) public users;
  address[] public usersList;

  // useful to know the row count in contracts index

  function getUserCount() public constant returns(uint userCount)
  {
   return usersList.length;
  }

  // deploy a new contract

  function newUser(address uid, string name, string surname, string interests, string about)
    public
    returns(address newUserAddress)
  {
    // TODO: throw error and return false if our user already exists
    // this is a security thing as we give new users shark coin, and if they sign up a new user, we give them coins
    address u = new User(uid, address(this), name, surname, interests, about);
    users[uid] = Data({
                        uid: uid,
                        factory: address(this),
                        name: name,
                        surname: surname,
                        interests: interests,
                        about: about
                      });
    usersList.push(uid);
    return u;
  }

  // TODO: function to ask if a buddy is registered ot the system
  /*function buddyRegister(address newBuddy) public
  {
    return false;
  }*/
  // TODO: Determine how this fits with the ERC223 token
}
