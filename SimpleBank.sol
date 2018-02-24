pragma solidity ^0.4.18;

contract SimpleBank {
  struct Transaction {
    address fromAddress;
    address toAddress;
    uint amount;
  }

  address owner;
  Transaction[] transactions;

  function SimpleBank() public {
    owner = msg.sender;
  }

  function deposit(address _fromAddress, uint _depositAmount) public {
    Transaction memory transaction = Transaction(_fromAddress, owner, _depositAmount);
    transactions.push(transaction);
  }

  function withdraw(address _toAddress, uint _withdrawAmount) public {
    Transaction memory transaction = Transaction(owner, _toAddress, _withdrawAmount);
    transactions.push(transaction);
  }

  function balance() public view returns (uint) {
    uint paidIn = 0;
    uint paidOut = 0;

    for (uint i = 0; i < transactions.length; i++) {
      if (transactions[i].toAddress == owner) {
        paidIn += transactions[i].amount;
      }

      if (transactions[i].fromAddress == owner) {
        paidOut += transactions[i].amount;
      }
    }

    return paidIn - paidOut;
  }

  function() public {
    revert();
  }
}
