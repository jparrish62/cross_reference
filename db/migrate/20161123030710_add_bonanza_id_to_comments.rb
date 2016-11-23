class AddBonanzaIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :bonanza, foreign_key: true
  end
end
