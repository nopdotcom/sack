###
# Ruby replacement for F, which is a ~/bin/F for github.com/zph/sack
# Sack was created by another author and forked zander@civet.ws
def main
  args = ARGV.dup

  case args.count
  when 0
    sack_shortcut = read_specific_line(0)
    exec "$EDITOR +#{sack_shortcut}"
  when 1
    shortcut_index = convert_to_zero_index(args.first)
    sack_shortcut = read_specific_line(shortcut_index)
    puts sack_shortcut
    exec "$EDITOR +#{sack_shortcut}"
  else
    vim_commands = args.map.with_index do |value, index|
      current_sack = read_specific_line(convert_to_zero_index(index))
      line_no = current_sack.split[0]
      filename = current_sack.split[1]
      puts sack_shortcut
      command = [
      "-c ",
      "'tabe +#{line_no} #{filename}'"
      ].join
    end.reverse

    complete_command = "$EDITOR #{vim_commands.join(" ")} -c 'tabclose 1'"
    exec complete_command
  end
rescue => e
  raise e, "Something went wrong"
  exit 1
end

def convert_to_zero_index(input)
  input.to_i - 1
end

def read_specific_line(line_number)
  File.new(File.expand_path "~/.sack_shortcuts").readlines[line_number].chomp
end

main
