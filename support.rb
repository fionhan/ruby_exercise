module Week
  FIRST_DAY = "Sunday"
  #This a class method
  def self.weeks_in_month #the same as Week.weeks_in_month
    "You have four weeks in a month"
  end
  #This is a class method, we can only use it by Week::weeks_in_year
  #I think these class methods are mainly tool methods.
  def self.weeks_in_year #the same as weeks_in_year
    "You have 52 weeks in a year"
  end
  #This is an instance method
  def instance_method
    "I am instance_method in module Week"
  end
end

module ExtendModuleTest
  def instance_method
    puts "I am an instance method in ExtendModuleTest module，when extended,I am a class method in that class"
  end
end