class FixChoice2ColumnName < ActiveRecord::Migration
  def change
    rename_column :pages, :choice2, :choice_2
  end
end
