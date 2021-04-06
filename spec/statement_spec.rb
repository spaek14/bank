require './lib/statement.rb'

describe Statement do
    let(:transaction1) { double :transaction1, date: '14/03/1998', credit: 420.00, debit: 0.00, before_balance: 0.00, after_balance: 420.00 }
    let(:transaction2) { double :transaction2, date: '15/03/1998', credit: 0.00, debit: 69.69, before_balance: 420.00, after_balance: 350.31 }
    let(:transaction3) { double :transaction3, date: '16/03/1998', credit: 20.00, debit: 0.00, before_balance: 350.31, after_balance: 370.31 }
    let(:transaction4) { double :transaction4, date: '17/03/1998', credit: 0.00, debit: 20.00, before_balance: 370.31, after_balance: 350.31 }
    let(:transactions) { [transaction1, transaction2, transaction3, transaction4] }
    let(:subject) { Statement.new(transactions) }

    it "has column names" do
        expect(subject.statementify.split("\n").first).to eq("date || credit || debit || balance")
    end
end