require 'spec_helper'

module ZfProbe
  describe TestProbe do
    it { is_expected.to includes(ZfProbe) }

    it 'includes ZfProbe::HTTP so that depdendency are managed correctly' do
      is_expected.to includes(ZfProbe::HTTP)
    end

    describe '#do_request' do
      it 'uses his monitor_url' do
        expect(HTTParty).to receive(:post).with(subject.monitor_url, {})
        subject.do_request({})
      end
    end

    describe '#after_notification' do
      let(:data) { {fake: "fake data"} }
      it 'returns monitor result ' do
        expect(subject.after_notification(data)).to eq(data)
      end
    end
  end
end