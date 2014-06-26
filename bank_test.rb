require 'minitest/autorun'
require 'minitest/pride'
require './bank'

class BankTest < Minitest::Test
  def setup
    @bank = Bank.new
  end

  def test_balance_in_account
    assert_equal 100, @bank.account(100)
  end

  def test_calculate_balance_in_account_after_deposit
    @bank.account(100)
    assert_equal 150, @bank.calculate_balance(@bank.deposit(50))
  end

  def test_amount_withdrawn_received_in_method
    assert_equal 100, @bank.withdraw(100)
  end

  def test_calculate_balance_in_account_after_withdrawal
    @bank.account(100)
    amount = @bank.deposit(50)
    assert_equal 50, @bank.calculate_balance(amount)
  end

end
