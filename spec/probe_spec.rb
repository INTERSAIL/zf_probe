require 'spec_helper'

describe 'Probe' do
  describe '#notify' do
    xit 'calls do_request with the given parameters'
    # will use event data as parameter
  end

  describe '#do_request' do
    xit 'will make the http request to the monitor'
    # params:
    #   sc_id: sc_id,
    #   customer_id: customer_id,
    #   product_id: product_id,
    #   service_id: service_id,
    #   event: {
    #   event_type: 'type1',
    #     result: 'ERROR',
    #     message: 'Msg',
    #     timestamp: time_now,
    #     heartbeat: is_heartbeat,
    #     data: {
    #       fake: 'data'
    #     }
    #   }
  end

  describe '#after_notification' do
    # will be called after the notification has been sent
    # accepts the monitor response
  end
end
