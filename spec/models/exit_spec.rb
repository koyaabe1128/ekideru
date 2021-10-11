require 'rails_helper'

RSpec.describe Exit, type: :model do
  describe "新規登録" do
    context "登録成功" do
      it "有効" do
        exit = build(:exit)
        expect(exit).to be_valid
      end 
    end
    
    context "登録失敗" do
      it "numberが空だと登録できない" do
        exit = build(:exit, number: "")
        expect(exit).to be_invalid
      end
      it "numberが６文字より大きいと登録できない" do
        exit = build(:exit, number: "a" * 7)
        expect(exit).to be_invalid
      end
      it "numberが重複していると登録できない" do
        exit = build(:exit)
        exit.save
        another_exit = build(:exit)
        expect(another_exit).to be_invalid
      end
    end
  end
end