module Heroku
  module Xcode
    RESERVED_KEYS = ["PATH", "LANG"]

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
        RESERVED_KEYS.each{|key| vars.delete(key)}

        filename = "#{app}.xcconfig"
        config = %{GCC_PREPROCESSOR_DEFINITIONS = $(inherited) #{vars.collect{|k,v| "\"#{k}=#{v}\""}.join(" ")}\n}
        File.open(filename, 'w') do |f|
          f.write(config)
        end

        display("Config variables successfully written to #{filename}")
      end
    end
  end
end

class Heroku::Command::Config < Heroku::Command::Base
  include Heroku::Xcode

  method_added "xcode"
end
