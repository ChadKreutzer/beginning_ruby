lines = File.readlines("text.txt")
text = lines.join
line_count = lines.size
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length
word_count = text.split.length
paragraph_count = text.split(/\r\n\r\n/).length
sentence_count = text.split(/\.|\?|!/).length
stopwords = %w{the a by on for of are with just but and to the by I has some in}

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
