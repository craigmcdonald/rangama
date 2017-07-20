require 'rails_helper'

describe Rangama::Dictionary do

  describe 'working with a 3 word dictionary' do
    let(:io) { StringIO.new( %w{ cat dog bat }.join("\n")) }
    let(:dictionary) { described_class.new(io) }
    it 'should load the dictionary' do
      expect(dictionary.dict).to eq(['cat', 'dog', 'bat'])
    end

    it 'should load the trie' do
      expect(dictionary.trie).to be_kind_of(Hash)
      expect(dictionary.trie).to have_key('c')
    end

    it 'should return true for cat' do
      expect(dictionary.search('cat')).to be
    end

    it 'should return false for catt' do
      expect(dictionary.search('catt')).to_not be
    end

    it 'should return false for ca' do
      expect(dictionary.search('ca')).to_not be
    end

    it 'should return false for caat' do
      expect(dictionary.search('caat')).to_not be
    end
  end

  describe 'working with a larger dictionary' do
    let(:small_txt) { File.expand_path('../assets/small.txt',__dir__) }
    let(:io) { File.open(small_txt) }
    let(:dictionary) { described_class.new(io) }

    # Very simple way of sanity checking that mispellings don't match.
    def modified_word(word)
      idx = rand(-1...word.length)
      str = word[idx]
      tmp_word = if idx.even?
        word.insert(idx,str)
      else
        word.delete(str)
      end
      return tmp_word unless dictionary.dict.include?(tmp_word)
      modified_word(word)
    end

    it 'should load the dictionary' do
      expect(dictionary.dict).to include('aardwolves')
    end

    File.open(File.expand_path('../assets/small.txt',__dir__))
    .readlines
    .map(&:chomp)
    .each do |word|
      it "should return true for #{word}" do
        expect(dictionary.search(word)).to be
      end

      it "should return false for modified #{word}" do
        expect(dictionary.search(modified_word(word))).to_not be
      end
    end
  end
end
