module FactoryBoy
  class Factory
    attr_accessor :instance

    def self.define_object(klass, &block)
      factory = new(klass)
      if block_given?
        factory.instance_eval(&block)
      end
      factory
    end

    def initialize(klass)
      @instance = klass.new
    end

    def override_with(attributes)
      attributes.each do |name, value|
        @instance.send("#{name}=", value)
      end
      @instance
    end

    def method_missing(name, *attrs, &block)
      @instance.send("#{name}=", attrs[0])
    end
  end
end
