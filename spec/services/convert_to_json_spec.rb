require 'rails_helper'

describe ConvertToJson do
  describe '.body_info' do
    context 'when is hash a string' do
      let(:value) { '{ "x": "y" }' }

      it 'returns string in json' do
        object = ConvertToJson.body_info(value)

        expect(object).to be_a(Hash) 
      end
    end

    context 'when is a hash' do
      let(:value) { { "x": "y" } }

      it 'returns string in json' do
        expect{ ConvertToJson.body_info(value) }.to raise_error TypeError
      end
    end

    context 'when is not a valid object' do
      let(:value) { 'testing' }
      let(:value_2) { ['variable_test'] }

      it 'returns string in json' do
        expect{ ConvertToJson.body_info(value) }.to raise_error JSON::ParserError
        expect{ ConvertToJson.body_info(value_2) }.to raise_error TypeError
      end
    end
  end
end