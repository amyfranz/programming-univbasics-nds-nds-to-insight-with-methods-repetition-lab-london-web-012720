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
  director_name = list_of_directors(source)
  directors_gross = directors_totals(source)
  puts directors_gross
  gross = 0
  i = 0
  while i < directors_gross.length do
    gross += directors_gross[director_name[i]]
    i+= 1
  end
  return gross
end


