module Rangama
  class FastSearch < BaseSearch

    def results
      [dictionary.search(word)]
    end

    private

    def dict_klass
      SortedDictionary
    end
  end
end
