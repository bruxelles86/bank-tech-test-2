Bank Tech Test
=================

Makers Academy week ten practice tech test, completed in Ruby using RSpec for unit tests. The app creates account objects, which can make deposits and withdrawals on their balances, and print account statements.

Installation & Testing
--------

* Simply fork or clone this repo, and run `bundle install`
* Run `irb`, and `require './lib/account.rb'. 
* Create a new Account object, passing it Balance, Log, Printer and Sorter as arguments
* All methods are then invoked through your Account instance
* Tests can be run by running `rspec` on the command line in the main project directory
* Likewise, run `rubocop` in the main directory to view syntax offenses

Features
--------

* Account holders can deposit and withdraw funds, and print a statement to the console
* Deposits and withdrawals allow an optional argument for the user to specify a date manually
* Statements are in reverse chronological order
* Transaction details, including a timestamp, are stored in the account log
* Account statements round amounts to two decimal places, and include trailing zeros

Initial Approach
--------

I began this challenge by spending about 20 minutes diagramming my plan, drawing classes for Account, Balance and Statement (later renamed Record), and the basic method logic for deposits, withdrawals and printing the account statement.

I also scribbled down ideas for eight tests. 

![20170612_160737-min](https://user-images.githubusercontent.com/20523607/27041386-c08eb1f4-4f8b-11e7-9c40-7635cf3e8c49.jpg)

My first move after initialising the project and getting RSpec set up was to write pending specs, which amounted to around 90% of all the tests I ended up needing. I committed after writing the assertion for each test, and again once the test was passing adequately.

One complication arose very near the end, right before submission, when I realised that the example printout included pennies/cents for the numbers. At this point, my program was written to use integers only. I considered three fixes, ranging from simply formatting the print_statement output to add zeros (meaning it would only work for whole numbers), to using a gem built for handling money values. In the end, I choose the middle route of using floats, which are normally not used to store money values in complex software. However, in this instance they seemed a proportionate solution that would meet the criteria of the test.

Starting from scratch
--------

Rewriting with a fresh repo in order to more properly extract out classes with individual responsibilities, I decided to create a new class, printer, with responsibility for printing statements from the log. While building printer, it occurred to me that the sorting of transaction details so that they would be in reverse-chronological order was a separate responsibility, and so I also extrated a 'sorter' class.

In order to properly isolate each class in testing, I extensively used doubles and stubs to ensure that each spec file only tests the behaviour of the one class under scrutiny. An overarching 'integration_spec.rb' checks that the task's acceptance criteria are met.
