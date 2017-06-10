class Ping < ApplicationRecord

	belongs_to :service

	before_save :check_service
	
	default_scope { order(created_at: :desc) }

	private
		def check_service 
			check = Net::Ping::External.new(service.host)
	    if check.ping?
	    	self.service_up = service.up!
	    else
	    	self.service_up = !service.down!
	    	ServiceMailer.send_error(service).deliver_now
	    end
		end
end
