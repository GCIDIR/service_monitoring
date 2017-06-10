class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t|
    	t.boolean	:service_up
    	t.references :service

    	t.timestamps
    end
  end
end
