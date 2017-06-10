class Service < ApplicationRecord
	include AASM
	has_many :pings, dependent: :destroy


	validates :name, presence: true
	validates :host, presence: true


	aasm do
		state :sleeping, :initial => true
    state :running

		event :up do
      transitions :from => :sleeping, :to => :running
      transitions :from => :running, :to => :running
    end

   	event :down do
     	transitions :from => :running, :to => :sleeping
      transitions :from => :sleeping, :to => :sleeping
    end
	end


	def state
		self.aasm_state
	end
end
