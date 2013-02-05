def palindrome?(word)
  word = word.downcase.gsub(/\W/,'')
  word == word.reverse
end

def count_words(string)
  count_words = {}
  string.downcase.scan(/\w+/) do |word|
    if count_words[word]
      count_words[word] += 1
    else
      count_words[word] = 1
    end
  end
  count_words
end
