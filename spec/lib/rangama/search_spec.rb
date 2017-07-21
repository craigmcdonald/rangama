require 'rails_helper'

describe Rangama::Search do

  let(:dictionary) { double('Dictionary')}
  let(:dictionary_instance) { double('DictionaryInstance')}
  subject(:search) { described_class.new('cat','foo',dict: dictionary)}

  before do
    allow(dictionary).to receive(:new).and_return(dictionary_instance)
    allow(dictionary_instance).to receive(:search) {|word| ['cat','act','tca'].include?(word) }
  end

  it 'should return [cat,act,tca]' do
    expect(search.results[0]).to eq(['cat','act','tca'])
  end

  it 'should return [cat,act,tca]' do
    expect(search.anagrams).to eq(['cat','act','tca'])
  end

  it 'should return [cta,atc,tac]' do
    expect(search.results[1]).to eq(['cta','atc','tac'])
  end

  describe 'with unsanitized input' do
    let(:word) { "Robert');--"}
    subject(:search) { described_class.new(word,'foo',dict: dictionary)}

    it 'should have a word of robert' do
      expect(search.word).to eq('robert')
    end
  end
end
