class CreateRaspberries < ActiveRecord::Migration
  def change
    create_table :raspberries do |t|
      t.string :name, null: false
      t.string :command, null: false
      t.timestamps null: false
    end
  end
end
