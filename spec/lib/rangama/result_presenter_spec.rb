require 'rails_helper'

describe Rangama::ResultPresenter do

  describe 'with three results' do
    let(:array) { %w{mon tues wed} }
    let(:word) { 'mon' }
    let(:result) { '3 results found for mon: mon, tues, wed' }
    subject { described_class.new(word,array).to_s }
    it {is_expected.to eq(result)}
  end

  describe 'with one result' do
    let(:array) { %w{mon} }
    let(:word) { 'mon' }
    let(:result) { '1 result found for mon: mon' }
    subject { described_class.new(word,array).to_s }
    it {is_expected.to eq(result)}
  end

  describe 'with no results' do
    let(:array) { [] }
    let(:word) { 'mon' }
    let(:result) { '0 results found for mon.' }
    subject { described_class.new(word,array).to_s }
    it {is_expected.to eq(result)}
  end

end
