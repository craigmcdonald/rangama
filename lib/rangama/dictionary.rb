module Rangama
  class Dictionary
    attr_reader :dict, :trie

    def initialize(io)
      @dict = load_dict(io)
      @trie = build_trie
    end

    def search(word,hash=trie)
      return true if hash[word].is_a?(Hash) && hash[word].keys.include?('$')
      return search(word[1..-1],hash[word[0]]) if hash[word[0]].is_a?(Hash)
      hash[word] == '$' || hash[word[0]] == word[1..-1] && word.length > 1
    end

    private

    def load_dict(io)
      dict = io.readlines.map(&:chomp)
      io.close
      dict
    end

    # TODO: Re-write this to use TCO.
    def build_trie(array=dict)
      chunked_hash(array).each_with_object({}) do |(k,v),a|
        a[k] = {} unless a[k]
        if v.is_a?(Array) && v.count > 1
          a[k].merge!(build_trie(v.map{ |str| str.length == 1 ? '$' : str[1..-1] }))
        else
          a[k] = set_value(v)
        end
      end
    end

    def set_value(v)
      str = v.map{ |s| s[1..-1] }.join
      str.length > 0 ? str : '$'
    end

    def chunked_hash(array)
      Hash[ array.map(&:downcase).sort.chunk { |word| word[0] }.to_a ]
    end
  end
end