// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract GrowrLoan {
    uint256 public id = 100;
    mapping(uint256 => Loan) loans;
    struct Loan {
        uint256 loanId;
        bool issued;
        address rbtcAddress;
        uint256 paymentPeriod;
        uint256 paymentDueDate;
        uint256 minPayment;
        uint256 interestRate;
        uint256 principal;
        uint256 totalPaymentsValue;
        uint256 awaitingCollection;
        uint256 paymentComplete;
    }

    Loan[] listLoans;

    function createNewLoan(
        address _rBTC,
        uint256 _minPayment,
        uint256 _paymentPeriod,
        uint256 _principal,
        uint256 _interestRate,
        uint256 _totalPaymentsValue
    ) public returns (uint256) {
        Loan memory loan;
        loan.loanId = ++id;
        loan.rbtcAddress = _rBTC;
        loan.minPayment = _minPayment;
        loan.paymentPeriod = _paymentPeriod;
        loan.interestRate = _interestRate;
        loan.issued = true;
        loan.paymentComplete = 0;
        loan.principal = _principal;
        loan.totalPaymentsValue = _totalPaymentsValue;
        loans[loan.loanId] = loan;
        listLoans.push(loan);
        return loan.loanId;
    }

    function getLoanLists() public view returns (Loan[] memory) {
        return listLoans;
    }
}
