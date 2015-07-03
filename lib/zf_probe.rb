require 'active_support/concern'
require 'active_support/core_ext/class/attribute.rb'
require 'httparty'
require 'erb'
require "zf_probe/configuration"
require "zf_probe/http"
require "zf_probe/version"

module ZfProbe
  extend ActiveSupport::Concern

  include Configuration
  include HTTP

  # == Monitor notifications
  # Event parameter needs to match the following structure:
  # {
  #   notification:
  #   {
  # (*)   event_type: 'type1',
  # (*)   result: 'ERROR',
  # (*)   message: 'Msg',
  #       heartbeat: is_heartbeat,
  # (*)   data: {
  #         fake: 'data'
  #       }
  #   }
  # }
  # NOTE: fields marked with (*) are mandatory
  # with this method the probe will send a notification to the
  # monitor. the response of the monitor is handled with the #after_notification method
  def notify(event_data)
    after_notification(do_request(build_req(event_data)))
  end

  def after_notification(res)
    raise StandardError, "You need to implement this method in your class."
  end

  private
  def build_req(event_data)
    {notification: base_config.merge({id: SecureRandom.uuid})
    .merge({event: build_event_data(event_data)})
    }
  end

  def build_event_data(event_data)
    event_data.merge({timestamp: Time.now.to_s})
  end
end

require "zf_probe/test_probe"
