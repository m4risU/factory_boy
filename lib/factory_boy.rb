require 'factory_boy/factory'

module FactoryBoy
  @factories = {}

  def self.define_factory(klass_sym, attributes = {}, &block)
    klass = Object.const_get(klass_name(attributes[:class] || klass_sym))
    @factories[klass_sym] = Proc.new do
      Factory.define_object(klass, &block)
    end
  end

  def self.build(klass, attributes = {})
    @factories[klass].call.override_with(attributes)
  end

  private

  def self.klass_name(klass_sym)
    klass_sym.to_s.split('_').map do |word|
      word[0] = word[0].upcase
      word
    end.join
  end
end
