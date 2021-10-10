require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    context "登録成功" do
      it "有効" do
        place = build(:place)
        expect(place).to be_valid
      end 
    end
    
    context "登録失敗" do
      it "nameが空だと登録できない" do
        place = build(:place, name: "")
        expect(place).to be_invalid
      end
      it "nameが３０文字を超えて登録できない" do
        place = build(:place, name: "a" * 31) 
        expect(place).to be_invalid
      end
      it "yomiganaが空だと登録できない" do
        place = build(:place, yomigana: "")
        expect(place).to be_invalid
      end
      it "yomiganaが７０文字を超えて登録できない" do
        place = build(:place, yomigana: "a" * 71) 
        expect(place).to be_invalid
      end
      it "yomiganaがひらがなでないと登録できない" do
        place = build(:place, yomigana: "アアアアア") 
        expect(place).to be_invalid
      end
    end
  end
end