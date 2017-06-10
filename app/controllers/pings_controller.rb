class PingsController < ApplicationController

	def index
		@service = Service.find(params[:service_id])
		@ping_history = @service.try(:pings).page(params[:page]).per(ENV['PER_PAGE'].to_i)
	end
end