module Rangama
  class PermutationArray
    attr_reader :words
    def initialize(word)
      @words = word.downcase.chars.permutation.map(&:join).uniq.reject(&:blank?)
    end
  end
end
