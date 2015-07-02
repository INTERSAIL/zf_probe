require 'spec_helper'

module ZfProbe
  describe HTTP do
    class HttpStub
      include HTTP
    end

    describe '#do_request' do
      # put this into another mixin for http requests
      xit 'makes the http request to the monitor' do
      end
    end
  end
end