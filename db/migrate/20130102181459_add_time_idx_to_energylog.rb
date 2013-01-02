class AddTimeIdxToEnergylog < ActiveRecord::Migration
  def change
    change_table :energylogs do |t|
      t.index :time
    end
  end
end
