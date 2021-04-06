require './lib/bank.rb'

describe Bank do
    context "can make deposits" do
        it "depositing £1000 to new account makes balance £1000" do
            bank = Bank.new
            bank.deposit(1000)
            expect(bank.balance).to eq(1000)
        end

        it "depositing x money to an account increases balance by x" do
            bank = Bank.new
            bank.deposit(500)
            random_number = [500, 1000, 1500, 2000, 2500].sample
            bank.deposit(random_number)
            expect(bank.balance).to eq(random_number + 500)
        end

        it "can only deposit valid amounts" do
            bank = Bank.new
            expect{ bank.deposit(1.003) }.to raise_error"please enter a valid amount"
        end
    end

    context "can make withdrawals" do
        it "withdrawing £1000 from account makes balance £1000 less than before" do
            bank = Bank.new
            bank.deposit(1500)
            bank.withdraw(1000)
            expect(bank.balance).to eq(1500 - 1000)
        end

        it "withdrawing x money from an account decreases balance by x" do
            bank = Bank.new
            bank.deposit(3000)
            random_number = [500, 1000, 1500, 2000, 2500].sample
            bank.withdraw(random_number)
            expect(bank.balance).to eq(3000 - random_number)
        end
        
        it "can only withdraw valid amounts" do
            bank = Bank.new
            bank.deposit(10)
            expect{ bank.withdraw(1.003) }.to raise_error"please enter a valid amount"
        end
    end
end