require 'rails_helper'

describe Rangama::PermutationArray do

  let(:word) { 'cat' }
  subject { described_class.new(word) }

  it 'should return an array of permutations for cat' do
    expect(subject.words).to eq(['cat', 'cta', 'act', 'atc', 'tca', 'tac'])
  end

  describe 'with an empty string' do
    let(:word) { '' }
    it 'should return an empty array of permutations' do
      expect(subject.words).to eq([])
    end
  end

end
