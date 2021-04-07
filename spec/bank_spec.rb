require './lib/bank.rb'

describe Bank do
let(:bank) { Bank.new }

    context "you can make deposits" do
        it "depositing £1000 to new account makes balance £1000" do
            bank.deposit(1000)
            expect(bank.balance).to eq(1000)
        end

        it "depositing x money to an account increases balance by x" do
            random_number = [500, 1000, 1500, 2000, 2500].sample
            bank.deposit(random_number)
            expect(bank.balance).to eq(random_number)
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
        end
    end
end