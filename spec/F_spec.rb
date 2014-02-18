require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/pride'
require 'mocha/mini_test'
require_relative '../lib/finder.rb'
require 'stringio'

require 'dotenv'

describe 'Sack::CLI' do

  before { Dotenv.load }
  after { ENV.delete('SACK_DEBUG') }

  describe '#initialize' do
    it 'sets default args' do
      sack = Sack::CLI.new()
      sack.args.must_equal []
      sack.output.must_equal STDOUT
    end

    it 'sets the debug status based on Env setting' do
      sack = Sack::CLI.new()
      sack.debug?.must_equal true
    end


    it 'sets the debug status based on arg' do
      sack = Sack::CLI.new(debug: true)
      ENV.delete('SACK_DEBUG')
      sack.debug?.must_equal true
    end

    it 'sets the shortcut file' do
      file = '~/.shortcut_file'
      sack = Sack::CLI.new( shortcut_file: file)
      sack.shortcut_file.must_equal file
    end

    it 'uses default shortcut file' do
      file = '~/.sack_shortcuts'
      sack = Sack::CLI.new()
      sack.shortcut_file.must_equal file
    end
  end

  describe 'editing methods' do
    describe '#edit_single_file' do
      subject { Sack::CLI.new( output: StringIO.new, shortcut_file: 'fixtures/.sack_shortcuts') }
      after {  subject.output.string = "" }
      it 'edits the 0 index item' do
        first_line = '5 /Users/zander/dotfiles/home/bin_repos/sack/bin/F'
        subject.edit_single_file(0)
        subject.output.string.chomp.must_equal first_line
      end

      it 'edits the X index file' do
        second_line = '49 /Users/zander/dotfiles/home/bin_repos/sack/bin/F'
        subject.edit_single_file(1)
        subject.output.string.chomp.must_equal second_line
      end
    end

    describe '#build_multiple_edit_commands' do
      subject { Sack::CLI.new( output: StringIO.new, shortcut_file: 'fixtures/.sack_shortcuts') }
      it 'creates a vim command for one file' do
        expected_result = "-c 'tabe +49 /Users/zander/dotfiles/home/bin_repos/sack/bin/F'"
        result = subject.build_multiple_edit_commands(1)
        result.must_equal expected_result
      end

      it 'outputs correct file info to commandline' do
        second_line = '49 /Users/zander/dotfiles/home/bin_repos/sack/bin/F'
        subject.build_multiple_edit_commands(1)
        subject.output.string.chomp.must_equal second_line
      end

    end

      describe '#main' do

        subject { Sack::CLI.new( output: StringIO.new, shortcut_file: 'fixtures/.sack_shortcuts') }

        describe  'no args' do
          it 'fires correct method' do
          subject.expects(:edit_single_file).with(0)
          subject.main
        end

        describe 'with one arg' do
          it 'fires correct method' do
            subject.expects(:edit_single_file).with(1)
            subject.main([2])
          end
        end
        describe 'with multiple arg' do
          it 'logs correct output from #main' do
            expected_output = "5 /Users/zander/dotfiles/home/bin_repos/sack/bin/F\n"
            expected_output += "49 /Users/zander/dotfiles/home/bin_repos/sack/bin/F\n"
            subject.main([1, 2])

            subject.output.string.must_equal expected_output
          end
          it 'logs correct output when instantiated from #initialize' do
            subject = Sack::CLI.new(input: [1,2],  output: StringIO.new, shortcut_file: 'fixtures/.sack_shortcuts')
            expected_output = "5 /Users/zander/dotfiles/home/bin_repos/sack/bin/F\n"
            expected_output += "49 /Users/zander/dotfiles/home/bin_repos/sack/bin/F\n"
            subject.main

            subject.output.string.must_equal expected_output
          end
        end
      end
    end
  end
end
