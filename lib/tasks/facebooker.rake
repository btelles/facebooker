require 'fileutils'

namespace :facebooker do

  desc "Create a basic facebooker.yml configuration file"
  task :setup => :environment do   
    facebook_config = File.join(Rails.root,"config","facebooker.yml")
    unless File.exist?(facebook_config)
      FileUtils.cp File.join(Rails.root,"vendor", "plugins", "facebooker", "facebooker.yml.tpl"), facebook_config 
      puts "Ensure 'GatewayPorts yes' is enabled in the remote development server's sshd config when using any of the facebooker:tunnel:*' rake tasks"
      puts "Configuration created in #{Rails.root}/config/facebooker.yml"
    else
      puts "#{Rails.root}/config/facebooker.yml already exists"
    end
  end 
        
end

