class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|

      t.timestamps
    end
  end
end
