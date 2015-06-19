# The DSL should check events, and also execute all the `setup` blocks before
# each event is evaluated.

lambda {
  setups = []
  events = []

  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  Kernel.send :define_method, :event do |description, &block|
    events << { :description => description, :condition => block }
  end

  Kernel.send :define_method, :each_setup do |&block|
    setups.each { |setup| block.call setup }
  end

  Kernel.send :define_method, :each_event do |&block|
    events.each { |event| block.call event }
  end
}.call # call the lambda immediately

load 'events.rb'

each_event do |event|
  each_setup { |s| s.call }
  puts "ALERT: #{event[:description]}" if event[:condition].call
end
