require './lib/transaction.rb'

describe Transaction do

    context "has attributes" do
        it "has a date" do
            transaction = Transaction.new(before_balance = 0, amount = 10)
            expect(transaction.date).to eq(Time.now.strftime('%d/%m/%y'))
        end

        it "has a before balance" do
            transaction = Transaction.new(before_balance = 0, amount = 10)
            expect(transaction.before_balance).to eq(0)
        end

        it "has an after balance" do
            transaction = Transaction.new(before_balance = 0, amount = 10)
            expect(transaction.after_balance).to eq(10)
        end
    end

    context "amount to credit/debit" do
        it "if amount is +x, credit = x" do
            transaction = Transaction.new(before_balance = 0, amount = 10)
            expect(transaction.credit).to eq(10)
        end

        it "if amount is -x, debit = x" do
            transaction = Transaction.new(before_balance = 0, amount = -10)
            expect(transaction.debit).to eq(10)
        end

        it "if amount is +x, debit = 0" do
            transaction = Transaction.new(before_balance = 0, amount = 10)
            expect(transaction.debit).to eq(0)
        end

        it "if amount is -x, credit = 0" do
            transaction = Transaction.new(before_balance = 0, amount = -10)
            expect(transaction.credit).to eq(0)
        end

        it "if amount is 0, raise error" do
            expect { transaction = Transaction.new(before_balance = 0, amount = 0) }.to raise_error"cannot process value of 0"
        end
    end
end