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

  def test_balance_in_account_after_deposit
    @bank.account(50)
    assert_equal 50, @bank.account(100)
  end

end
