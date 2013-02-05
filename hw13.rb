def combine_anagrams(words)
  anagrams = []
  until words.empty? do
    anagrams << words.select { |word| word.is_anagram_of? words.first }
    words -= anagrams.flatten
  end
  anagrams
end

class String
  def is_anagram_of?(string)
    self.downcase.sort_letters == string.downcase.sort_letters
  end

  def sort_letters
    chars.sort(&:casecmp).join
  end
end
