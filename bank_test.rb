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


end
