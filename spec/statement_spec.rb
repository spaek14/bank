require './lib/statement.rb'

describe Statement do
    let(:transaction1) { double :transaction1, date: '14/03/1998', credit: 420.00, debit: "", before_balance: 0.00, after_balance: 420.00 }
    let(:transaction2) { double :transaction2, date: '15/03/1998', credit: "", debit: 69.69, before_balance: 420.00, after_balance: 350.31 }
    let(:transaction3) { double :transaction3, date: '16/03/1998', credit: 20.00, debit: "", before_balance: 350.31, after_balance: 370.31 }
    let(:transaction4) { double :transaction4, date: '17/03/1998', credit: "", debit: 20.00, before_balance: 370.31, after_balance: 350.31 }
    let(:transactions) { [transaction1, transaction2, transaction3, transaction4] }
    let(:subject) { Statement.new(transactions) }
    
    context "table" do
        it "has column names" do
            expect(subject.statementify.split("\n").first).to eq("date || credit || debit || balance")
        end
    end

    context "statementify method" do
        it "shows nth transaction nth" do
            expect(subject.statementify.split("\n")[1]).to eq("14/03/1998 || 420.0 ||  || 420.0")
            expect(subject.statementify.split("\n")[2]).to eq("15/03/1998 ||  || 69.69 || 350.31")
            expect(subject.statementify.split("\n")[3]).to eq("16/03/1998 || 20.0 ||  || 370.31")
            expect(subject.statementify.split("\n")[4]).to eq("17/03/1998 ||  || 20.0 || 350.31")
        end

        it "shows all transactions correctly" do
            expect(subject.statementify).to eq("date || credit || debit || balance\n14/03/1998 || 420.0 ||  || 420.0\n15/03/1998 ||  || 69.69 || 350.31\n16/03/1998 || 20.0 ||  || 370.31\n17/03/1998 ||  || 20.0 || 350.31")
        end
    end
end