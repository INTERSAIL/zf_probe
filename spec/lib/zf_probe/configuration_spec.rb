require 'spec_helper'

module ZfProbe
  describe Configuration, type: :module do
    class ConfigurationStub
      include ZfProbe
    end

    subject { ConfigurationStub.new }

    describe 'configuration' do
      it 'has base configuration params' do
        expect(subject.base_config[:sc_id]).to_not be_nil
        expect(subject.base_config[:customer_id]).to_not be_nil
        expect(subject.base_config[:product_id]).to_not be_nil
        expect(subject.base_config[:service_id]).to_not be_nil
      end

      it 'has a monitor_url' do
        expect(subject).to respond_to(:monitor_url)
      end
    end
  end
end