# The DSL should check events, and also execute all the `setup` blocks before
# each event is evaluated.

def setup(&block)
  @setups << block
end

def event(description, &block)
  @events << { :description => description, :condition => block }
end

@setups = []
@events = []

load 'events.rb'

@events.each do |event|
  @setups.each { |s| s.call }
  puts "ALERT: #{event[:description]}" if event[:condition].call
end
