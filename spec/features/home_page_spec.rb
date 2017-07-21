require 'rails_helper'

describe '/' do

  before { visit '/' }
  subject { page }
  it { is_expected.to have_selector('#search > div > label', text: 'Enter a word to search for anagrams:') }
  it { is_expected.to have_button('Go') }
  it { is_expected.to have_field('dictionary', type: 'file') }
  it { is_expected.to have_button('load new dictionary') }
  it { is_expected.to have_link('clear searches') }
  it { is_expected.to have_text('Anagram Finder') }

  describe 'with foo.txt dictionary' do

    before do
      attach_file 'dictionary', 'spec/assets/foo.txt'
      click_button 'load new dictionary'
    end

    describe 'searching for an anagram' do
      it 'should add the search term to the head of the list of previous searches' do
        fill_in 'Enter a word to search for anagrams:', with: 'foo'
        click_button 'Go'
        expect(subject).to have_selector('ul > li:nth-child(1)', text: 'foo')
        fill_in 'Enter a word to search for anagrams:', with: 'bar'
        click_button 'Go'
        expect(subject).to have_selector('ul > li:nth-child(1)', text: 'bar')
        expect(subject).to have_selector('ul > li:nth-child(2)', text: 'foo')
      end
    end

    describe 'clearing the search history' do
      it 'should clear the list of previous searches' do
        fill_in 'Enter a word to search for anagrams:', with: 'foo'
        click_button 'Go'
        expect(subject).to have_selector('ul > li:nth-child(1)', text: 'foo')
        click_link 'clear searches'
        expect(subject).to_not have_selector('ul > li:nth-child(1)', text: 'foo')
      end
    end
  end

  describe 'uploading a dictionary' do
    it 'should return a success message when a file is uploaded' do
      attach_file 'dictionary', 'spec/assets/tiny.txt'
      click_button 'load new dictionary'
      expect(subject).to have_text('dictionary uploaded successfully')
    end

    it 'should return a failure message when a file is not uploaded' do
      click_button 'load new dictionary'
      expect(subject).to have_text('please select a valid file')
    end
  end
end
