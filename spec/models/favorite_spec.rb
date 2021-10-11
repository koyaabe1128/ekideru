require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "いいね機能" do
    context "登録成功" do
      it "有効" do
        favorite = create(:favorite)
        expect(favorite).to be_valid
      end 
    end
    
    context "登録失敗" do
      it "user_idが空だと登録できない" do
        favorite = build(:favorite, user_id: nil)
        expect(favorite).to be_invalid
      end
      it "place_idが空だと登録できない" do
        favorite = build(:favorite, place_id: nil)
        expect(favorite).to be_invalid
      end
      it "user_idとplace_idは一意でなければ登録できない" do
        favorite = create(:favorite)
        favorite2 = build(:favorite, user_id: favorite.user_id, place_id: favorite.place_id)
        expect(favorite2).to be_invalid
      end
    end
  end
end