module Rangama
  class BaseDictionary
    attr_reader :dict, :data_structure, :uuid

    def initialize(io=nil,uuid=nil,persist=false)
      @uuid = uuid if uuid
      if io
        @dict = load_dict(io)
        load_data_structure(persist)
      elsif uuid
        @data_structure = Redis::HashKey.new(uuid,marshal: true)
      else
        raise ArgumentError.new('Invalid argument(s)')
      end
    end

    def search(*args)
      raise NotImplementedError.new('#search must be implemented on child class')
    end

    private

    def load_dict(io)
      Redis::HashKey.new(uuid, marshal: true).clear
      dict = io.readlines.map(&:chomp)
      io.close
      dict
    end

    def load_data_structure(persist)
      tmp_data_structure, redis_hash = build_data_structure, nil
      if persist
        return raise ArgumentError.new("UUID is invalid") unless uuid
        redis_hash = Redis::HashKey.new(uuid,marshal: true)
        tmp_data_structure.keys.each do |key|
          redis_hash[key] = tmp_data_structure[key]
        end
      end
      @data_structure = redis_hash || tmp_data_structure
    end

    def build_data_structure(*args)
      raise NotImplementedError.new('#build_data_structure must be implemented on child class')
    end
  end
end
