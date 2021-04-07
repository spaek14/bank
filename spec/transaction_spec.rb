require './lib/transaction.rb'

describe Transaction do

let(:subject) { Transaction.new(before_balance = 0, amount = 10) }
let(:subject_negative) { Transaction.new(before_balance = 0, amount = -10) }

    context "has attributes" do
        it "has a date" do
            expect(subject.date).to eq(Time.now.strftime('%d/%m/%y'))
        end

        it "has a before balance" do
            expect(subject.before_balance).to eq(0)
        end

        it "has an after balance" do
            expect(subject.after_balance).to eq(10)
        end
    end

    context "converts amount to credit/debit accordingly" do
        context "+x amount of money" do
            it "if amount is +x, credit = x" do
                expect(subject.credit).to eq(10)
            end

            it "if amount is +x, debit = """ do
                expect(subject.debit).to eq("")
            end
        end

        context "-x amount of money" do
            it "if amount is -x, debit = x" do
                expect(subject_negative.debit).to eq(10)
            end

            it "if amount is -x, credit = """ do
                expect(subject_negative.credit).to eq("")
            end
        end
        
        context "0 money" do
            it "if amount is 0, raise error" do
                expect { transaction = Transaction.new(before_balance = 0, amount = 0) }.to raise_error"cannot process value of 0"
            end
        end
    end
end