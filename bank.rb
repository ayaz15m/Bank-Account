class Bank
  def initialize
    @balance = 0
  end

  def account(balance)
    @balance = balance
  end

  def deposit(deposit_amount)
    deposit_amount
  end

  def withdraw(withdrawal_amount)
    withdrawal_amount
  end

  def calculate_balance(amount)
    @balance += amount
  end
end
