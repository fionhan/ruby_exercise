class Decade
  $LOAD_PATH << '.'
  require 'support' # requier the filename which contains the module
  include Week #when include a module, we are going to inherit its instance method,and if we don't need to inherit from the module, we will not include it
  def module_method_weeks_in_month
    Week::weeks_in_month
  end
end

class ExtendModule
  extend ExtendModuleTest
end

#-------------exercise of include module----------------
puts "--"*20
decade=Decade.new
#puts decade.instance_method
puts decade.module_method_weeks_in_month
puts decade.instance_method #inherit from its included module's instance method
p Week.method_defined? :weeks_in_month #only judge if the instance method is exist
p Decade.method_defined? :module_method_weeks_in_month

#-------------exercise of extend module----------------
puts "--"*20
extend_module=ExtendModule.new
puts "when a module being extended, is the instance method of the module inherited by the current class ? #{ExtendModule.method_defined? :instance_method}"

ExtendModule::instance_method