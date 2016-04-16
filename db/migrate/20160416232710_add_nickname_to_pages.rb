class AddNicknameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :nickname, :string
  end
end
