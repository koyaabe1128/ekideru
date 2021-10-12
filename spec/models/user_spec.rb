require "rails_helper"

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
      it "nameが３０文字より大きいと登録できない" do
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
        expect(another_user).to be_invalid
      end
      it "emailが不正なフォーマットだと登録できない" do
        expect(build(:user, email: "sample@sample,com")).to be_invalid
        
        expect(build(:user, email: "sample_sample.com")).to be_invalid
        
        expect(build(:user, email: "sample@sample_user@sample.com")).to be_invalid
        
        expect(build(:user, email: "sample@sample+user.com")).to be_invalid
        
        expect(build(:user, email: "1111@1111.111")).to be_invalid
      end
      it "passwordが空だと登録できない" do
        user = build(:user, password: "")
        expect(user).to be_invalid
      end
      it "passwordが６文字未満だと登録できない" do
        user = build(:user, password: "User1", password_confirmation: "User1")
        expect(user).to be_invalid
      end
      it "passwordが１２文字より大きいと登録できない" do
        user = build(:user, password: "User123456789", password_confirmation: "User123456789")
        expect(user).to be_invalid
      end
      it "passwordが全角だと登録できない" do
        user = build(:user, password: "ああああああ")
        expect(user).to be_invalid
      end
      it "passwordが不正なフォーマットだと登録できない" do
        expect(build(:user, password: "123456", password_confirmation: "123456")).to be_invalid
        
        expect(build(:user, password: "usersample", password_confirmation: "usersample")).to be_invalid
        
        expect(build(:user, password: "USERSAMPLE", password_confirmation: "USERSAMPLE")).to be_invalid
        
        expect(build(:user, password: "user12", password_confirmation: "user12")).to be_invalid
        
        expect(build(:user, password: "USER12", password_confirmation: "USER12")).to be_invalid
        
        expect(build(:user, password: "USERsample", password_confirmation: "USERsample")).to be_invalid
      end
      it "password_confirmationが空だと登録できない" do
        user = build(:user, password_confirmation: "")
        expect(user).to be_invalid
      end
      it "password_confirmationがpasswordと不一致だと登録できない" do
        user = build(:user, password_confirmation: "User12345")
        expect(user).to be_invalid
      end
    end
  end
  
  describe "パスワードの検証" do
    it "passwordが暗号化されていること" do
      user = build(:user)
      expect(user.encrypted_password).to_not eq 'User1234'
    end
  end
  
  describe "メールアドレスの検証" do
    it "emailは小文字で登録されていること" do
      user = build(:user, email: "SAMPLE@SAMPLE.COM")
      user.save
      expect(user.reload.email).to eq 'sample@sample.com'
    end
  end
end