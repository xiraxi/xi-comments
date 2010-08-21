class CreateCommentables < ActiveRecord::Migration
  def self.up
    create_table :commentables do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :commentables
  end
end
