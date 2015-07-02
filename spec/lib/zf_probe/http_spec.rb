require 'spec_helper'

module ZfProbe
  describe HTTP do

    class HTTPStub
      include Configuration
      include HTTP
    end

    subject { HTTPStub.new }

    describe '#do_request' do
      let(:data) { {fake_data: {fake: "data"}} }
      it 'makes the http request to the monitor' do
        expect(HTTParty).to receive(:post).with(subject.monitor_url, data)
        subject.do_request(data)
      end
    end
  end
end