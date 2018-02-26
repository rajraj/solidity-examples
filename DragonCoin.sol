pragma solidity ^0.4.20;

contract DragonCoin {
  address public creator;
  mapping(address => uint) public balances;

  event Delivered(address _from, address _to, uint _amount);

  function DragonCoin() public {
    creator = msg.sender;
  }

  function create(address _receiver, uint _amount) public {
    require(msg.sender == creator);
    balances[_receiver] += _amount;
  }

  function transfer(address _receiver, uint _amount) public {
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] -= _amount;
    balances[_receiver] += _amount;
    Delivered(msg.sender, _receiver, _amount);
  }
}
