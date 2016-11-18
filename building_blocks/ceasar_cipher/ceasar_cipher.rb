def ceasar_cipher(string, shift_factor)
  transformed_string = ""
  string.each_char do |char|
    transformed_string << shifted_character(char, shift_factor)
  end
  transformed_string
end

def shifted_character(char, shift_factor)
  if char.match(/[a-zA-Z]/)
    (((char.ord - ordinal_shift(char) + shift_factor) % 26) + ordinal_shift(char)).chr
  else
    char
  end
end

def ordinal_shift char
  if char.match(/[A-Z]/)
    65
  else
    97
  end
end

