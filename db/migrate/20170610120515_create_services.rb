class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
    	t.string	:name
    	t.string 	:ip
    	t.string 	:host
    	t.string	:aasm_state

      t.timestamps
    end
  end
end
