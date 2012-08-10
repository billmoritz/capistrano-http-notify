require 'capistrano-http-notify/version'

module CapistranoHttpNotify
  # Execute the given block of code within the context of the capistrano configuration.
  def self.with_configuration(&block)
    Capistrano::Configuration.instance(:must_exist).load(&block)
  end
end

require 'capistrano-http-notify/notify'