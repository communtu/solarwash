class CreateEnergylogs < ActiveRecord::Migration
  def change
    create_table :energylogs do |t|
      t.datetime :time
      t.integer :solar
      t.integer :external

      t.timestamps
    end
  end
end
