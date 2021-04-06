class Statement

    def initialize(transactions)
        @transactions = transactions
    end

    def statementify
        names + "\n" + "hello"
    end

private

    def names
        "date || credit || debit || balance"
    end

end