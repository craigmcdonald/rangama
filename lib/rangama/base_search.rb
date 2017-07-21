module Rangama
  class BaseSearch
    attr_reader :dictionary, :result_formatter, :results, :word

    def initialize(string,user,opts={})
      @result_formatter = fetch_formatter(opts)
      @word = sanitize_word(string)
      @dictionary = fetch_dict(opts).new(nil,user,true)
      after_initialize(opts)
    end

    def after_initialize(opts);end

    def anagrams(format=false)
      format ? result_formatter.new(word,results[0]).to_s : results[0]
    end

    def results
      raise NotImplementedError.new('#results must be implemented on child class')
    end

    private

    def sanitize_word(word)
      word.gsub(/[^a-z]/i, '').downcase
    end

    def fetch_dict(opts)
      opts.fetch(:dict) { return dict_klass }
    end

    def dict_klass
      raise NotImplementedError.new('#dict_klass must be implemented on child class')
    end

    def fetch_formatter(opts)
      opts.fetch(:result) { return presenter_klass }
    end

    def presenter_klass
      ResultPresenter
    end
  end
end
