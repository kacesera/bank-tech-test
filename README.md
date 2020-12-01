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
## Process

My approach was relatively straightforward: Satisfy the user stories, and then extract into the following additional classes:

1. ATMPrinter
2. Transaction

While under other circumstances (such as with a much larger project), I would outline my potential classes and how they interact before writing tests, because this project is comparatively small-- I decided that taking a complete test-driven approach to its design would be the most beneficial. 

After extracting the ATMPrinter class from the ATM class, I noticed that I needed to classify each transaction to print it appropriately. Because of this, I decided to extract the Transaction class from the ATM class as well. In doing this, I was able to greatly simplify my code and improve the readability of my tests across all classes.

## How to use

1. Load up `IRB` or a REPL of your choice
2. Require the ATM.rb file: `./lib/atm.rb`
3. Instantiate a new ATM class: `atm = ATM.new`

- To make a deposit: `atm.deposit(500)`
- To make a withdrawal: `atm.withdraw(500)`
- To see your current balance: `atm.current_balance`
- To print your transaction history: `atm.print_transaction_history`
