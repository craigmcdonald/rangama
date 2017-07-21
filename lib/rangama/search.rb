require 'forwardable'
module Rangama
  class Search < BaseSearch
    extend Forwardable
    def_delegator :@words, :words

    def after_initialize(opts)
      @words = PermutationArray.new(word[0..7])
    end

    def results
      @results ||= words.partition { |word| dictionary.search(word) }
    end

    private

    def dict_klass
      Dictionary
    end
  end
end
