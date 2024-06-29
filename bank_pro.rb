# The Account class represents a bank account with basic functionalities.
class Account
    # Initialize an account with an owner and a balance. Default balance is 0.
    def initialize(owner, balance=0)
      @owner = owner
      @balance = balance    
    end
  
    # Deposit method increases the balance by the amount deposited and prints the new balance.
    def deposit(amount)
      @balance += amount
      puts "#{@owner} Deposited #{amount}. New balance: #{@balance}"
    end
  
    # Withdraw method decreases the balance by the amount withdrawn if there are sufficient funds.
    # If there are insufficient funds, it prints an error message.
    def withdraw(amount)
      if amount > @balance
        puts "Sorry Insufficient funds."
      else
        @balance -= amount
        puts "#{@owner} Withdrawn #{amount}.  New balance: #{@balance}."
      end
    end
  
    # Private methods to read the owner and balance attributes.
    private
    attr_reader :owner, :balance
  end
  
  # The SavingsAccount class inherits from Account and adds an interest rate.
  class SavingsAccount < Account
    # Initialize a savings account with an owner, a balance, and an interest rate.
    def initialize(owner, balance, interest_rate)
      super(owner, balance)
      @interest_rate = interest_rate
    end
  
    # The add_interest method calculates the interest based on the balance and interest rate,
    # adds it to the balance, and prints the new balance.
    def add_interest
      interest = @balance * @interest_rate / 100
      @balance += interest
      puts "#{@owner} Interest added. New balance: #{@balance}."
    end
  end
  
  # The CheckingAccount class inherits from Account and modifies the withdraw method.
  class CheckingAccount < Account
    # The withdraw method in CheckingAccount includes a fee for each withdrawal.
    def withdraw(amount)
      fee = 10
      amount += fee
      super(amount)
    end
  end
  
  # Create instances of each account type and perform some actions to demonstrate their functionality.
  account = Account.new("Rubens Pro", 200)
  account.deposit(122)
  account.withdraw(50)
  
  savings_account = SavingsAccount.new("Saver Jean Simon", 300, 25)
  savings_account.deposit(200)
  savings_account.withdraw(20)
  savings_account.add_interest
  
  checking_account = CheckingAccount.new("Checker Pro", 500)
  checking_account.deposit(200)
  checking_account.withdraw(100)
  
  # To see the results, run the file in the terminal with the command: ruby <name of the file>