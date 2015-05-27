class Decade
  $LOAD_PATH << '.'
  require 'support' # requier the filename which contains the module
  include Week #when include a module, we are going to inherit its instance method,and if we don't need to inherit from the module, we will not include it
  def module_method_weeks_in_month
    Week::weeks_in_month
  end
end

decade=Decade.new
#puts decade.instance_method
puts decade.module_method_weeks_in_month

p Week.method_defined? :weeks_in_month#only judge if the instance method is exist
p Decade.method_defined? :module_method_weeks_in_month