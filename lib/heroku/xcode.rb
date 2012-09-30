module Heroku
  module Xcode
    # config:xcode
    #
    # write environment variables out to .xcconfig file
    #
    # Examples:
    #
    # $ heroku config:xcode -a app_name
    #
    def xcode
      validate_arguments!
  
      vars = api.get_config_vars(app).body
      if vars.empty?
        display("#{app} has no config vars.")
      else
        config = %{GCC_PREPROCESSOR_DEFINITIONS = $(inherited) #{vars.collect{|k,v| "#{k}=#{v}"}.join(" ")}\n}
        display(config)

        File.open("#{app}.xcconfig", 'w') do |f|
          f.write(config)
        end
      end
    end
  end
end

class Heroku::Command::Config < Heroku::Command::Base
  include Heroku::Xcode

  method_added "xcode"
end
