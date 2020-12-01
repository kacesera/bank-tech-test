# Bank tech test

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
## Planning

### User Stories

```
As a client,
So that I can have money in my bank account,
I would like to make a deposit.

As a client,
So that I can use my money,
I would like to make a withdrawal.

As a client,
So that I can protect myself from fraud,
I would like to see the dates to be included with each transaction.

As a client,
So that I don't overdraft,
I would like to know my balance.

As a client,
So that I can keep track of my finances,
I would like to see my transaction history.
```

