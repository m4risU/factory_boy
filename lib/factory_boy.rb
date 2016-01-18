require 'factory_boy/factory'

module FactoryBoy
  @factories = {}

  def self.klass_name(klass_sym)
    klass_sym.to_s.split('_').map do |word|
      word[0] = word[0].upcase
      word
    end.join
  end

  def self.define_factory(klass_sym, attributes = {}, &block)
    klass = Object.const_get(klass_name(attributes[:class] || klass_sym))
    @factories[klass_sym] = Proc.new do
      factory = Factory.new(klass)
      if block_given?
        factory.instance_eval(&block)
      end
      factory.instance
    end
  end

  def self.build(klass, attributes = {})
    instance = @factories[klass].call
    attributes.each do |key, value|
      instance.send("#{key}=", value)
    end
    instance
  end
end
