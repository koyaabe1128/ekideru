require "rails_helper"

RSpec.describe Connection, type: :model do
  describe "出口設定" do
    context "登録成功" do
      it "有効" do
        connection = create(:connection)
        expect(connection).to be_valid
      end 
    end
    
    context "登録失敗" do
      it "place_idが空だと登録できない" do
        connection = build(:connection, place_id: nil)
        expect(connection).to be_invalid
      end
      it "exit_idが空だと登録できない" do
        connection = build(:connection, exit_id: nil)
        expect(connection).to be_invalid
      end
      it "place_idとexit_idは一意でなければ登録できない" do
        connection = create(:connection)
        connection2 = build(:connection, place_id: connection.place_id, exit_id: connection.exit_id)
        expect(connection2).to be_invalid
      end
    end
  end
end