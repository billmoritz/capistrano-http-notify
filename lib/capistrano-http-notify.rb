require 'capistrano-http-notify/version'
require 'capistrano-http-notify/notify'

module CapistranoHttpNotify
  # Execute the given block of code within the context of the capistrano configuration.
  def self.with_configuration(&block)
    Capistrano::Configuration.instance(:must_exist).load(&block)
  end
end