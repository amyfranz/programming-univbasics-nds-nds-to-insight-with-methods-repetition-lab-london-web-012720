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
    directors_names = []
  i = 0
  while i < source.length do
    directors_names.push(source[i][:name])
    i += 1 
  end
  return directors_names
end

def total_gross(source)
  directors_names = list_of_directors(source)
  while i < directors_names.length do
    directors_totals(source[i])
    i+= 1
  end
  directors_totals(source)
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


