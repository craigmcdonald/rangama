require 'rails_helper'

describe Rangama::FastSearch do
  let(:word) { 'cat' }
  let(:dictionary) { double('Dictionary')}
  let(:dictionary_instance) { double('DictionaryInstance')}
  subject(:search) { described_class.new(word,'foo',dict: dictionary)}

  before do
    allow(dictionary).to receive(:new).and_return(dictionary_instance)
    allow(dictionary_instance).to receive(:search) do |word|
      {'act' => ['cat','act','tca']}[word.chars.sort.join] || []
    end
  end

  it 'should return [cat,act,tca]' do
    expect(search.results[0]).to eq(['cat','act','tca'])
  end

  describe 'word with no anagrams' do
    let(:word) { 'dog' }
    it 'should return []' do
      expect(search.results[0]).to eq([])
    end
  end
end
