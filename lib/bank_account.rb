require 'date'

class Bank_account
  
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def make_a_deposit(amount, date)
    @balance += amount
    record_a_deposit(date, amount, @balance)
  end

  def make_a_withdrawal(amount, date)
    @balance -= amount
    record_a_withdrawal(date, amount, @balance)
  end

  def print_bank_statement
    @history.reverse.map.with_index do |statement_line, index|
      print "date || credit || debit || balance" if index.zero? 
      print "\n#{statement_line}"
    end
  end

  private

  def format_date(date)
    Date.parse(date).strftime("%d/%m/%Y")
  end

  def format_amount(amount)
    format('%.2f', amount)
  end

  def format_deposit(date, amount, balance)
    "#{format_date(date)} || #{format_amount(amount)} || || #{format_amount(@balance)}"
  end 

  def format_withdrawal(date, amount, balance)
    "#{format_date(date)} || || #{format_amount(amount)} || #{format_amount(@balance)}"
  end 

  def record_a_deposit(date, amount, balance)
    @history << format_deposit(date, amount, balance)
  end

  def record_a_withdrawal(date, amount, balance)
    @history << format_withdrawal(date, amount, balance)
  end
end