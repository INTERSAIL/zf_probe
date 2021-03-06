require 'spec_helper'

module ZfProbe
  describe TestProbe do
    it { is_expected.to includes(ZfProbe)}

    describe '#after_notification' do
      let(:data) { {fake: "fake data"} }
      it 'returns monitor result ' do
        expect(subject.after_notification(data)).to eq(data)
      end
    end
  end
end