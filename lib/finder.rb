###
# Ruby replacement for F, which is a ~/bin/F for github.com/zph/sack
# Sack was created by another author and forked zander@civet.ws
module Sack
  class CLI
    attr_accessor :args, :output, :debug, :shortcut_file
    def initialize(params = {})
      @args = params.fetch(:input) { [] }
      @output = params.fetch(:output){ STDOUT }
      @debug = params.fetch(:debug) { false }
      @shortcut_file = params.fetch(:shortcut_file) { "~/.sack_shortcuts" }
    end

    def edit_single_file(index)
      sack_shortcut = read_specific_line(index)
      output.puts sack_shortcut
      exec( "$EDITOR +#{sack_shortcut}" ) unless debug?
    end

    def build_multiple_edit_commands(value)
      sack_shortcut = read_specific_line(value.to_i)
      line_no, filename = sack_shortcut.split(' ', 2)
      output.puts sack_shortcut
      command = [ "-c", "'tabe +#{line_no} #{filename}'" ].join(' ')
    end

    def main(args=args)
      case args.count
      when 0
        edit_single_file(0)
      when 1
        shortcut_index = convert_to_zero_index(args.first)
        edit_single_file(shortcut_index)
      else
        vim_commands = args.map.with_index do |value, index|
          build_multiple_edit_commands(convert_to_zero_index(value))
        end.reverse

        complete_command = "$EDITOR #{vim_commands.join(" ")} -c 'tabclose 1'"
        exec( complete_command ) unless debug?
      end
    rescue => e
      raise(StandardError, "Something went wrong: #{e.message}\n\t#{e.backtrace.inspect}")
      exit 1
    end

    def convert_to_zero_index(input)
      input.to_i - 1
    end

    def read_specific_line(line_number)
      File.new(File.expand_path shortcut_file).readlines[line_number].chomp
    end

    def debug?
      ENV['SACK_DEBUG'] == 'true' || debug
    end

  end

  def self.debug?
    CLI.new().debug?
  end
end

