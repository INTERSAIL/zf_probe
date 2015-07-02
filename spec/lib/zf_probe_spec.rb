require 'spec_helper'

describe ZfProbe, type: :module do
  it 'has a version number' do
    expect(ZfProbe::VERSION).not_to be nil
  end

  class ProbeStub
    include ZfProbe
  end

  subject { ProbeStub.new }

  it { is_expected.to includes(ZfProbe::HTTP) }
  it { is_expected.to includes(ZfProbe::Configuration) }

  describe '#notify' do
    let(:res) { {} }
    let(:time_str) { "2015-07-02 12:28:46 +0200" }
    let(:random_id) { "e34bbe64-25be-4cf5-91a1-77883e40147e" }
    it 'calls do_request with the given parameters' do
      allow(Time).to receive_message_chain(:now, :to_s) { time_str }
      allow(SecureRandom).to receive(:uuid) { random_id }
      req_params = {
          notification: {
              id: random_id,
              sc_id: subject.base_config[:sc_id],
              customer_id: subject.base_config[:customer_id],
              product_id: subject.base_config[:product_id],
              service_id: subject.base_config[:service_id],
              event: {
                  timestamp: time_str
              }
          }
      }
      expect(subject).to receive(:do_request).with(req_params) { res }
      allow(subject).to receive(:after_notification)

      subject.notify({})
    end
  end

  describe '#after_notification' do
    let(:data) { {fake: "json_data"} }
    it 'is called after #notification with the do_request response data' do
      allow(subject).to receive(:do_request) { data }
      expect(subject).to receive(:after_notification).with(data)

      subject.notify({})
    end

    it 'raises_error by default' do
      expect { subject.send("after_notification", {}) }.to raise_error(StandardError, "You need to implement this method in your class.")
    end
  end
end
