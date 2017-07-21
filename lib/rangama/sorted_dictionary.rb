module Rangama
  class SortedDictionary < BaseDictionary
    # This uses a hash of sorted lists as the data structure.
    def search(word)
      data_structure[word.chars.sort.join] || []
    end

    private

    def build_data_structure(array=dict)
      array.each_with_object(Hash.new([])) do |word, hash|
        hash[word.chars.sort.join] += [word]
      end
    end
  end
end
