require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/pride'
require 'mocha/mini_test'
require_relative '../lib/sack.rb'
require 'stringio'

require 'dotenv'

describe Sack do
  let(:bad_data) { File.read('fixtures/no_lines.out') }
  let(:good_data) { File.read('fixtures/ruby_stack_trace.out') }

  describe '::Stdin' do

    before do
      module Kernel
        def exit(arg)
        end
      end
    end

    describe 'bad data' do

      it 'exits if no bad data' do
        Object.expects(:exit).at_least_once
        Sack::Stdin.search(bad_data.split("\n"))
      end
    end

    describe 'good data' do
      it 'doesnt exit if no bad data' do

        old_stdout = STDOUT
        STDOUT = StringIO.new

        Object.expects(:exit).never
        Sack::Stdin.search(good_data.split("\n"))

        STDOUT = old_stdout
      end

    end
    describe '#search' do
    end
  end

  describe '::Stack::Parser' do
    it 'returns an empty array if bad data' do
      parser = Sack::Stack::Parser.new(bad_data.split("\n"))
      lines = parser.ruby_trace

      lines.must_equal []
    end
  end
end
