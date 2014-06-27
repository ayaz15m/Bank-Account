require 'minitest/autorun'
require 'minitest/pride'
require './bank'

class BankTest < Minitest::Test
  def setup
    @bank = Transactions.new
    @balance = 1000
  end

  def test_balance_in_account
    assert_equal @balance, @bank.account(@balance, 0)
  end

  def test_calculate_balance_in_account_after_deposit
    deposit_amount = @bank.deposit(50)
    assert_equal 1050, @bank.account(@balance, deposit_amount)
  end

  def test_calculate_balance_in_account_after_withdrawal
    withrawal_amount = @bank.withdraw(50)
    assert_equal 950, @bank.account(@balance, withrawal_amount)
  end

  def test_calculate_balance_in_account_after_withdrawal_and_deposit
    withrawal_amount = @bank.withdraw(50)
    new_balance = @bank.account(@balance, withrawal_amount)

    deposit_amount = @bank.deposit(75)
    assert_equal 1025, @bank.account(new_balance, deposit_amount)
  end

end
