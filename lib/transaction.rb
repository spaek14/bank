class Transaction
    attr_reader :date, :before_balance, :after_balance, :credit, :debit

    def initialize(before_balance, amount)
        @date = Time.now.strftime('%d/%m/%y')
        @before_balance = before_balance
        @after_balance = before_balance + amount
        @credit = nil
        @debit = nil
        if amount.positive? 
            @credit = amount
        elsif amount != 0
            @debit = -amount
        else raise "cannot process value of 0"
        end
    end
end