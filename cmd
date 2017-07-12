#!/usr/bin/env ruby

require "colorize"

lib = "/usr/local/etc/cmd/lib.cmd"
system "mkdir -p /usr/local/etc/cmd/"

$options = ARGV.select { |a| /^[\-]/ =~ a }
$values  = ARGV.select { |a| /^[^\-]/ =~ a }

def forge_command(lib)
  args = ARGV[1..-1]
  unless File.exist?(lib)
    abort "you need to add file"
  end
  lines = File.readlines(lib)
    .select { |line| /^[\w]+=[\w]+$/ }
    .map    { |line| line.split("=").map { |x| x.strip }}
    .flatten
  command = Hash[*lines][$values[0]]
  command += " " +  args.join(" ")

  puts "#{command}".cyan
  command
end


case $options.first
when "-h"
  puts
  puts "cmd -a                  ... add command"
  puts "cmd -a [key] [commands] ... add command"
  puts "cmd -l                  ... list command"
  puts "cmd -cp [key]           ... add command to the clipboard"
  puts "cmd -dr [key]           ... dry run command"
  puts "cmd [key]               ... execute command"
  puts "cmd [key] [args...]     ... execute command with additional args"
when "-a"
  if $values.size > 0 
    f = File.open(lib, "a")
    f.puts "#{$values[0]}=#{$values[1..-1].join(' ')}"
    f.close
  else
    system "vim #{lib}"
  end  
when "-l"  
  system "cat #{lib}"
when  "-cp"
  system "echo \"#{forge_command(lib)}\" | pbcopy"
when "-dr"  
  puts "#{forge_command(lib)}"
else
  system "#{forge_command(lib)}"
end
