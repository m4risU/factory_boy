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
        name "foobar"
        admin true
      end
    end

    subject { FactoryBoy.instance_variable_get(:@factories) }

    it { expect(subject.size).to eq(1) }
    it { expect(subject.keys).to include(:admin) }
    it { expect(subject[:admin].class).to eq(Proc)}

    describe 'contained Proc' do
      subject! { FactoryBoy.instance_variable_get(:@factories)[:admin].call.instance }

      it 'should result in a Foo object' do
        expect(subject.class).to eq(Foo)
      end

      describe 'attributes initialization' do
        it 'string value is correct' do
          expect(subject.name).to eq('foobar')
        end
        it 'bool value is correct' do
          expect(subject.admin).to be_truthy
        end
      end
    end
  end

  describe 'self.build' do
    before do
      FactoryBoy.define_factory(:admin, class: Foo) do
        name "foobar"
        admin true
      end
    end

    subject { FactoryBoy.build(:admin, name: 'Bar', admin: false) }

    it { expect(subject.name).to eq('Bar') }
    it { expect(subject.admin).to be_falsey }
  end
end
