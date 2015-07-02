require 'spec_helper'

module ZfProbe
  describe Configuration, type: :module do
    class ConfigurationStub
      include ZfProbe
    end

    subject { ConfigurationStub.new }

    describe 'configuration' do
      it 'has base configuration params' do
        expect(subject.base_config[:sc_id]).to eq("1")
        expect(subject.base_config[:customer_id]).to eq("2")
        expect(subject.base_config[:product_id]).to eq("3")
        expect(subject.base_config[:service_id]).to eq("4")
      end

      it 'has a monitor_url' do
        expect(subject).to respond_to(:monitor_url)
      end
    end
  end
end