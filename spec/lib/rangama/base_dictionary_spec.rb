require 'rails_helper'

describe Rangama::BaseDictionary do
  let(:io) { StringIO.new( %w{ cat dog bat }.join("\n")) }
  let(:dictionary) { described_class.new(io) }

  it 'should raise NotImplementedError when loading dictionary' do
    msg = '#build_data_structure must be implemented on child class'
    expect { dictionary }.to raise_error(NotImplementedError,msg)
  end

  it 'should raise NotImplementedError when #search is called' do
    allow_any_instance_of(described_class).to receive(:build_data_structure).and_return({})
    msg = '#search must be implemented on child class'
    expect { dictionary.search('word') }.to raise_error(NotImplementedError,msg)
  end
end
