require 'rails_helper'

RSpec.describe Place, type: :model do
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
        place.valid?
        expect(place.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが３０文字を超えて登録できない" do
        place = build(:place, name: "a" * 31) 
        place.valid?
        expect(place.errors.full_messages).to include("Name is too long (maximum is 30 characters)")
      end
      # it "nameが重複していて無効" do
      #   place = build(:place)
      #   place.save
      #   another_place = build(:place, yomigana: "あああああ")
      #   another_place.valid?
      #   expect(another_place.errors.full_messages).to include("")
      # end
      it "yomiganaが空だと登録できない" do
        place = build(:place, yomigana: "")
        place.valid?
        expect(place.errors.full_messages).to include("Yomigana can't be blank")
      end
      it "yomiganaが７０文字を超えて登録できない" do
        place = build(:place, yomigana: "a" * 71) 
        place.valid?
        expect(place.errors.full_messages).to include("Yomigana is too long (maximum is 70 characters)")
      end
      it "yomiganaがひらがなでないと登録できない" do
        place = build(:place, yomigana: "アアアアア") 
        place.valid?
        expect(place.errors.full_messages).to include("Yomigana is invalid")
      end
      # it "yomiganaが重複していて無効" do
      #   place = build(:place)
      #   place.save
      #   another_place = build(:place, name: "あああああ")
      #   another_place.valid?
      #   expect(another_place.errors.full_messages).to include("")
      # end
    end
  end
end