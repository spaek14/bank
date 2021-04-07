class Transaction
    attr_reader :date, :before_balance, :after_balance, :credit, :debit

    def initialize(before_balance, amount)
        @date = Time.now.strftime('%d/%m/%y')
        @before_balance = '%.2f' % before_balance
        @after_balance = '%.2f' % (before_balance + amount)
        @credit = nil
        @debit = nil
        if amount.positive? 
            @credit = '%.2f' % amount
        elsif amount != 0
            @debit = '%.2f' % -amount
        else raise "cannot process value of 0"
        end
    end
end