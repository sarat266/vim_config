require "rubygems"
require "awesome_print"

Pry.print  = proc { |output, value| output.puts value.ai }
if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'b', 'backtrace'
  Pry.commands.alias_command 'e', 'exit'
  Pry.commands.alias_command 'rl', 'rails-log'
  Pry.commands.alias_command 'al', 'ar-log'

end

Pry::Commands.block_command 'rails-log', 'Set rails logger to stdout' do
  if defined?(Rails)
    Rails.logger = Logger.new(STDOUT)
  end
end

Pry::Commands.block_command 'ar-log', 'Sets ActiveRecord logger to stdout' do
  if defined?(Rails)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
end

Pry::Commands.block_command 'pbcopy', 'Copy to buffer' do |input|
  def pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  pbcopy(input)
end
