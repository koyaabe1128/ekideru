require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    context "登録成功" do
      it "有効" do
        user = build(:user)
        expect(user).to be_valid
      end 
    end
    
    context "登録失敗" do
      it "nameが空だと登録できない" do
        user = build(:user, name: "")
        expect(user).to be_invalid
      end
      it "nameが３０文字を超えて登録できない" do
        user = build(:user, name: "a" * 31)
        expect(user).to be_invalid
      end
      it "emailが空だと登録できない" do
        user = build(:user, email: "")
        expect(user).to be_invalid
      end
      it "emailが重複していると登録できない" do
        user = build(:user)
        user.save
        another_user = build(:user, password: "654321")
        another_user.valid?
        expect(another_user).to be_invalid
      end
      it "passwordが空だと登録できない" do
        user = build(:user, password: "")
        expect(user).to be_invalid
      end
      it "passwordが全角だと登録できない" do
        user = build(:user, password: "ああああああ")
        expect(user).to be_invalid
      end
      it "passwordが６文字未満だと登録できない" do
        user = build(:user, password: "12345")
        expect(user).to be_invalid
      end
      it "passwordが１２８文字以上だと登録できない" do
        user = build(:user, password: "1" * 129)
        expect(user).to be_invalid
      end
      it "password_confirmationが空、passwordと不一致だと登録できない" do
        user = build(:user, password_confirmation: "")
        expect(user).to be_invalid
      end
    end
  end
end