require 'spec_helper'

describe ZfProbe, type: :module do
  it 'has a version number' do
    expect(ZfProbe::VERSION).not_to be nil
  end

  class ProbeStub
    include ZfProbe
  end

  subject { ProbeStub.new }

  it { is_expected.to includes(ZfProbe::HTTP)}

  describe 'configuration' do
    it 'has monitor configuration params' do
        expect(ZfProbe::SC_ID).to eq("1")
        expect(ZfProbe::CUSTOMER_ID).to eq("2")
        expect(ZfProbe::PRODUCT_ID).to eq("3")
        expect(ZfProbe::SERVICE_ID).to eq("4")
        expect(ZfProbe::MONITOR_URL).to eq("http://the-monitor-url:port")
    end
  end

  describe '#notify' do
    let(:res) { {} }
    let(:time_str) { "2015-07-02 12:28:46 +0200" }
    it 'calls do_request with the given parameters' do
      expect(Time).to receive_message_chain(:now,:to_s) { time_str }
      req_params = {
          sc_id: ZfProbe::SC_ID,
          customer_id: ZfProbe::CUSTOMER_ID,
          product_id: ZfProbe::PRODUCT_ID,
          service_id: ZfProbe::SERVICE_ID,
          event: {
            timestamp: time_str
          }
      }
      expect(subject).to receive(:do_request).with(req_params) { res }
      allow(subject).to receive(:after_notification)

      subject.notify({})
    end
  end

  describe '#after_notification' do
    let(:data) { {fake: "json_data" } }
    it 'is called after #notification with the do_request response data' do
      allow(subject).to receive(:do_request) {data}
      expect(subject).to receive(:after_notification).with(data)

      subject.notify({})
    end

    it 'raises_error by default' do
      expect{subject.send("after_notification", {})}.to raise_error(StandardError, "You need to implement this method in your class.")
    end
  end
end
