require "zf_probe/version"
require "zf_probe/http"
require 'active_support/concern'
require 'net/http'

module ZfProbe
  extend ActiveSupport::Concern
  include HTTP

  # Monitor configuration Data
  SC_ID = "1"
  CUSTOMER_ID = "2"
  PRODUCT_ID = "3"
  SERVICE_ID = "4"
  MONITOR_URL = "http://the-monitor-url:port"

  # == Monitor notifications
  # Event parameter needs to match the following structure:
  #      {
  # (*)    event_type: 'type1',
  # (*)    result: 'ERROR',
  # (*)    message: 'Msg',
  #        heartbeat: is_heartbeat,
  # (*)    data: {
  #          fake: 'data'
  #        }
  #      }
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
    config.merge({id: SecureRandom.uuid})
    .merge({event: build_event_data(event_data)})
  end

  def build_event_data(event_data)
    event_data.merge({timestamp: Time.now.to_s})
  end

  def config
    {
        sc_id: SC_ID,
        customer_id: CUSTOMER_ID,
        product_id: PRODUCT_ID,
        service_id: SERVICE_ID
    }
  end
end
