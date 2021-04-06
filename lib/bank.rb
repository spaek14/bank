class Bank
    attr_reader :balance

    def initialize
        @balance = 0
    end

    def deposit(money)
        raise "please enter a valid amount" unless valid?(money)
        @balance += money
    end

    def withdraw(money)
        raise "please enter a valid amount" unless valid?(money)
        @balance -= money
    end

private

    def valid?(money)
        money_int = money.is_a? Integer
        money_float = money.is_a? Float
        money_float_valid = money.to_s.split(".").last.length <= 2

        money_int || money_float && money_float_valid
    end
end