class Transactions
  def account(balance, amount)
    @balance = balance
    return calculate_balance(amount)
  end

  def deposit(deposit_amount)
    return deposit_amount
  end

  def withdraw(withdrawal_amount)
    amount = -withdrawal_amount
    return amount
  end

  def calculate_balance(amount)
    @balance += amount
  end
end

class Teller
  def initialize
    @transactions = Transactions.new
  end

  def ask_user_which_transaction
    is_answered_correctly = false

    until is_answered_correctly
      print "Would you like to make a deposit or withdrawal(d/w)? "
      answer = gets.chomp.strip.downcase
      puts "\n"
      is_answered_correctly = check_response(answer)
    end
  end

  def check_response(answer)
    if answer == "d"
      @answer = "deposit"
      return is_answered_correctly = true

    elsif answer == "w"
      @answer = "withdraw"
      return is_answered_correctly = true

    else
      puts "Please enter w to withdraw or d to deposit."
      puts "\n"
      return is_answered_correctly = false
    end
  end

  def check_transaction_amount
    is_answered_correctly = false

    until is_answered_correctly
      print "How much would you like to #{@answer}? "
      @money = gets.chomp.strip.to_i
      puts "\n"

      if @answer == "withdraw" && @money > @balance
        puts "Please enter a withdrawal amount less than your balance of $#{@balance}."
        puts "\n"
      else
        is_answered_correctly = true
      end
    end
  end

  def get_new_balance
    method = @answer.to_sym

    amount = @transactions.send(method, @money)

    new_balance = @transactions.account(@balance, amount)

    puts "Your new balance is $#{new_balance}."
    puts "\n"

    return new_balance
  end

  def main(balance)
    system "clear" or system "cls"

    @balance = balance

    puts "You have a balance of #{@balance}."
    puts "\n"

    ask_user_which_transaction

    check_transaction_amount

    @new_balance = get_new_balance

    ask_user_for_another_transaction
  end

  def ask_user_for_another_transaction
    is_answered_correctly = false

    until is_answered_correctly

      print "Would you like to make another transaction today(y/n)? "
      answer = gets.chomp.strip.downcase
      puts "\n"

      if answer == "y"
        @new_balance = self.main(@new_balance)

      elsif answer == "n"
        puts "Thank you, have a great day!"
        is_answered_correctly = false
        break

      else
        puts "Please enter a valid respnse."
        puts "\n"
      end
    end
    exit
  end
end
