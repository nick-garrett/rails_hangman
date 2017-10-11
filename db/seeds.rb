Word.destroy_all
File.readlines(Rails.root + 'config/dictionary.txt').each { |cur_word| Word.create(word: cur_word) }
