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
        expect(Net::HTTP).to receive(:post_form).with(URI(subject.monitor_url), data)
        subject.do_request(data)
      end
    end
  end
end