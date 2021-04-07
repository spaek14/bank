require './lib/bank.rb'

describe Bank do
let(:bank) { Bank.new }

    context "you can make deposits" do
        it "depositing £1000 to new account makes balance £1000" do
            bank.deposit(1000)
            expect(bank.balance).to eq(1000)
        end

        it "depositing x money to an account increases balance by x" do
            random_number = [500, 1000, 1500, 2000, 2500]
            random_number.each { |number|
            bank.deposit(number)
            expect(bank.balance).to eq(number) 
            bank.withdraw(number) }
        end

        it "can only deposit valid amounts" do
            expect{ bank.deposit(1.003) }.to raise_error"please enter a valid amount"
        end
    end

    context "can make withdrawals" do

        before do
            bank.deposit(3000)
        end

        it "withdrawing £1000 from account makes balance £1000 less than before" do
            bank.withdraw(1000)
            expect(bank.balance).to eq(2000)
        end

        it "withdrawing x money from an account decreases balance by x" do
            random_number = [500, 1000, 1500, 2000, 2500].sample
            bank.withdraw(random_number)
            expect(bank.balance).to eq(3000 - random_number)
        end
        
        it "can only withdraw valid amounts" do
            expect{ bank.withdraw(1.003) }.to raise_error"please enter a valid amount"
            expect{ bank.withdraw(3.997) }.to raise_error"please enter a valid amount"
            expect{ bank.withdraw(1.001203910233) }.to raise_error"please enter a valid amount"
            expect{ bank.withdraw(99.9999003) }.to raise_error"please enter a valid amount"
        end

        it "can only deposit valid amounts" do
            expect{ bank.deposit(1.003) }.to raise_error"please enter a valid amount"
            expect{ bank.deposit(3.997) }.to raise_error"please enter a valid amount"
            expect{ bank.deposit(1.001203910233) }.to raise_error"please enter a valid amount"
            expect{ bank.deposit(99.9999003) }.to raise_error"please enter a valid amount"
        end
    end

    context ".statement method" do
        let(:transaction1) { double :transaction1, date: '14/03/1998', credit: 420.00, debit: "", before_balance: 0.00, after_balance: 420.00 }
        let(:transaction2) { double :transaction2, date: '15/03/1998', credit: "", debit: 69.69, before_balance: 420.00, after_balance: 350.31 }
        let(:transaction3) { double :transaction3, date: '16/03/1998', credit: 20.00, debit: "", before_balance: 350.31, after_balance: 370.31 }
        let(:transaction4) { double :transaction4, date: '17/03/1998', credit: "", debit: 20.00, before_balance: 370.31, after_balance: 350.31 }
        let(:transactions_list) { [transaction1, transaction2, transaction3, transaction4] }
        
        it "shows correct transactions in order" do
            expect(Statement.new(transactions_list).statementify.split("\n")[1]).to eq("14/03/1998 || 420.0 ||  || 420.0")
            expect(Statement.new(transactions_list).statementify.split("\n")[2]).to eq("15/03/1998 ||  || 69.69 || 350.31")
            expect(Statement.new(transactions_list).statementify.split("\n")[3]).to eq("16/03/1998 || 20.0 ||  || 370.31")
            expect(Statement.new(transactions_list).statementify.split("\n")[4]).to eq("17/03/1998 ||  || 20.0 || 350.31")
        end
        
        it "returns the correct statement to be puts-ed" do
            expect(Statement.new(transactions_list).statementify).to eq("date || credit || debit || balance\n14/03/1998 || 420.0 ||  || 420.0\n15/03/1998 ||  || 69.69 || 350.31\n16/03/1998 || 20.0 ||  || 370.31\n17/03/1998 ||  || 20.0 || 350.31")
        end
        
        it "puts-es the correct thing" do
            bank = Bank.new
            bank.deposit(1000)
            bank.withdraw(200)
            expect { bank.statement }.to output("date || credit || debit || balance\n07/04/21 || 1000 ||  || 1000\n07/04/21 ||  || 200 || 800\n").to_stdout
        end
    end
end