require "bundler/gem_tasks"

require 'repl_rake'
ReplRake.setup

task :compile => [:F, :sack] do
end

task :F do
  compile_to_bin("F.rb")
end

task :sack do
  compile_to_bin("sack.rb")
end

def compile_to_bin(filename)
  require 'erb'
  bin = "bin/#{filename.gsub(/\..*/, '')}"
  output = ERB.new(File.read(File.expand_path("templates/#{filename}.erb"))).result
  File.write(bin, output)
  File.chmod(0755, bin)
end
