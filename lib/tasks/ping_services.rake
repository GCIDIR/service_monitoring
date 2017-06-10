namespace :services do
  desc "Ping all services to see if there are available or not"
  task :send_ping => :environment do
  	Service.all.each do |s|
  		s.pings.create
  	end
  end
end