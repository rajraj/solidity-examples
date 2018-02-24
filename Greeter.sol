pragma solidity ^0.4.20;

contract Greeter {
  address creator;
  string greeting;

  function Greeter() public {
    creator = msg.sender;
  }

  function setGreeting(string _greeting) public {
    greeting = _greeting;
  }

  function greet() public constant returns (string) {
    return greeting;
  }

  function() {
    revert();
  }
}
