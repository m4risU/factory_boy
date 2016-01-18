module FactoryBoy
  class Factory
    attr_accessor :instance

    def initialize(klass)
      @instance = klass.new
    end

    def method_missing(name, *attrs, &block)
      @instance.send("#{name}=", attrs[0])
    end
  end
end
