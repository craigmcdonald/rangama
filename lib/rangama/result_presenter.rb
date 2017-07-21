module Rangama
  class ResultPresenter

    attr_reader :word, :array
    def initialize(word,array)
      @word, @array = word, array
    end

    def to_s
      "#{array.count} #{result_inflector} found for #{word}#{punctuation}#{array.join(', ')}"
    end

    private

    def punctuation
      return ': ' if array.any?
      '.'
    end

    def result_inflector
      return 'result' if array.count == 1
      'results'
    end
  end
end
