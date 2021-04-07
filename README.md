## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

```
As a customer,
So that I can store my money,
I would like to be able to make a deposit.

As a customer,
So that I can access my money,
I would like to be able to make a withrawal.

As a customer,
So that I can track my finances,
I want to be able to request account statements.
```

In order to run this app, load the runner.rb file by inputting the following, when in the app directory:
```
irb -r "./lib/runner.rb"
```
Create an instance of the Bank class:
```
bank = Bank.new
```
Deposit x amount of money:
```
bank.deposit(x)
```
Withdraw x amount of money:
```
bank.withdraw(x)
```
Print your bank statement:
```
bank.statement
```

In order to install the code, fork this repo and pull it to a local directory. Then, run the following:
```
bundle install
```
to install the relevant gems. 
To run the tests, from the terminal, while in the directory, run:
```
rspec -fd
```
to see the tests pass.
You should also be able to see the test coverage, which at the time of writing this is 98.26%!