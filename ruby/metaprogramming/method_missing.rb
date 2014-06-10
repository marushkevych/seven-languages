class Dummy
  def method_missing(m, *args, &block)
    puts "There is no method called #{m} here"
  end
end

Dummy.new.anything