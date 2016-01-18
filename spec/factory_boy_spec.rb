require 'spec_helper'

class Foo
  attr_accessor :name
  attr_accessor :admin
end

RSpec.describe FactoryBoy do

  describe 'self.klass_name' do
    it { expect(FactoryBoy.klass_name(:foo)).to eq('Foo') }
    it { expect(FactoryBoy.klass_name(:Bar)).to eq('Bar') }
    it { expect(FactoryBoy.klass_name(:foo_bar)).to eq('FooBar') }
    it { expect(FactoryBoy.klass_name(:foo_bar_baz)).to eq('FooBarBaz') }
  end

  describe 'self.define_factory' do
    before do
      FactoryBoy.define_factory(:admin, class: Foo) do
        name "fobar"
        admin true
      end
    end

    subject { FactoryBoy.instance_variable_get(:@factories) }

    it { expect(subject.size).to eq(1) }
    it { expect(subject.keys).to include(:admin) }
    it { expect(subject[:admin].class).to eq(Proc)}

    describe 'contained Proc' do
      # TODO
    end
  end
end
