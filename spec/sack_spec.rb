require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/pride'
require 'mocha/mini_test'
require_relative '../lib/sack.rb'

require 'dotenv'

describe Sack do
  let(:bad_data) { File.read('fixtures/no_lines.out') }
  describe '::Stdin' do

    describe 'bad data' do
      # it 'fails gracefully' do
      #   Sack::Stdin.search(bad_data.split("\n"))
      # end

      # it 'exits if no bad data' do
      #   Kernel.expects(:exit).with(1).at_least_once
      #   Sack::Stdin.search(bad_data)

      # end
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
