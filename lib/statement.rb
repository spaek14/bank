class Statement

    def initialize(transactions)
        @transactions = transactions
    end

    def statementify
        if @transactions.empty?
            return names
        else
            return names + "\n" + @transactions.map { |x| "#{x.date} || #{x.credit} || #{x.debit} || #{x.after_balance}"}.join("\n")
        end
    end

private

    def names
        "date || credit || debit || balance"
    end

end