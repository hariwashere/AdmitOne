class CreateKeywordsTable < ActiveRecord::Migration
  def up
    create_table :keywords do |t|
      t.string :keyword
    end
  end

  def down
    drop_table :keywords
  end
end
