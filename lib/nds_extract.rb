$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'


def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  # pp result
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  array = [] 
  index = 0 
  
  while index < source.length do 
    array.push(source[index][:name])
    index += 1 
  end
  
  # Write this implementation 
  # [{:name=>"Larry"}, {:name=>"Curly"}, {:name=>"Moe"}, {:name=>"Iggy"}] 
  # rspec spec/nds_extract.rb -e list_of_directors
  
  array 
end


def total_gross(source)
  total = 0 
  index = 0 
  
  director_gross_hash = directors_totals(source)
  director_list_array = list_of_directors(source)
  
  # this is a hash of director's names (keys) and grosses (values)
  # this points to each director's name: director_list_array[index]
  
  while index < director_list_array.length do 
    total += director_gross_hash[director_list_array[index]] 
    # this makes more sense if tracing/looking from the inside out
    # index at 0 points to "Steven Spielberg" in the array. "Stephen Spielberg" in the hash points to the gross of his movies. 
    index += 1 
  end 
  
  total 
end
  
  # directors_totals[]... 

  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of 
  # { dir_name => gross, "Stephen Spielberg"=>1357566430, "Russo Brothers"=>2281002470, "James Cameron"=>2571020373 }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total



