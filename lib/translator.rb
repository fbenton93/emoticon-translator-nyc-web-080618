require 'yaml'
require 'pry'

def load_library(file_path)
  emojis = YAML.load_file(file_path)
  return_hash = { "get_meaning" => {}, "get_emoticon" => {}}
  emojis.each do |key,value|
    return_hash["get_meaning"][value[1]] = key
    return_hash["get_emoticon"][value[0]] = value[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path,emoticon)
  library = load_library(file_path)
  return_value = nil
  library["get_emoticon"].each do |key,value|
    if key == emoticon
      return_value = value
    end
  end


  if return_value == nil
    return "Sorry, that emoticon was not found"
  else
    return_value
  end
end







def get_english_meaning(file_path,j_emoticon)
  library = load_library(file_path)
  return_value = nil
  library["get_meaning"].each do |key,value|
    if key == j_emoticon
      return_value = value
    end
  end

  if return_value == nil
    return "Sorry, that emoticon was not found"
  else
    return_value
  end  
end


#{"get_meaning"=>
#  {"☜(⌒▽⌒)☞"=>"angel",
#   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#   "(ΘεΘ;)"=>"bored",
#   "(゜.゜)"=>"confused",
#   "(#^.^#)"=>"embarrased",
#   ">゜))))彡"=>"fish",
#   "(^0_0^)"=>"glasses",
#   "(￣ー￣)"=>"grinning",
#   "(＾ｖ＾)"=>"happy",
#   "(*^3^)/~☆"=>"kiss",
#   "(Ｔ▽Ｔ)"=>"sad",
#   "o_O"=>"surprised",
#   "(^_-)"=>"wink"},
# "get_emoticon"=>
#  {"O:)"=>"☜(⌒▽⌒)☞",
#   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#   ":O"=>"(ΘεΘ;)",
#   "%)"=>"(゜.゜)",
#   ":$"=>"(#^.^#)",
#   "><>"=>">゜))))彡",
#   "8D"=>"(^0_0^)",
#   "=D"=>"(￣ー￣)",
#   ":)"=>"(＾ｖ＾)",
#   ":*"=>"(*^3^)/~☆",
#   ":'("=>"(Ｔ▽Ｔ)",
#   ":o"=>"o_O",
#   ";)"=>"(^_-)"}}
