require 'spec_helper'

class Foo
  attr_accessor :name
end

RSpec.describe FactoryBoy::Factory do

  describe 'self.define_object' do
    subject { FactoryBoy::Factory.define_object(Foo) { name 'Bar' }.instance }

    it { expect(subject.class).to eq(Foo) }
    it { expect(subject.name).to eq('Bar') }
  end

  describe '#initialize' do
    subject { FactoryBoy::Factory.new(Foo).instance.class }

    it 'assigns local instance' do
      is_expected.to eq(Foo)
    end
  end

  describe '#override_with(attributes)' do
    subject { FactoryBoy::Factory.new(Foo) { name 'Bar' } }

    it 'changes object attributes on fresh onstance' do
      expect { subject.override_with(name: 'Baz') }.to change { subject.instance.name }.from(nil).to('Baz')
    end
  end

  describe '#method_missing' do
    class Bar
      attr_accessor :first_name
    end

    subject { FactoryBoy::Factory.define_object(Bar) { first_name 'Foo' } }

    it 'uses method missing to assign attrbiutes' do
      expect(subject.class).to eq(FactoryBoy::Factory)
      expect{ subject.first_name "FooBar" }.to change { subject.instance.first_name }.from('Foo').to('FooBar')
    end
  end
end
