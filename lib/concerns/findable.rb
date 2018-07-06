module Concerns::Findable
  def find_by_name(name)
    all.detect{ |o| o.name == name }
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  # def self.find_by_name(name)
  #   @@all.detect{|song| song.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end  
  
  # def self.find_or_create_by_name(artist)
  #   # binding.pry
  #   self.class.all.find {|a| a.name == artist}  || self.create(artist)
  # end

end