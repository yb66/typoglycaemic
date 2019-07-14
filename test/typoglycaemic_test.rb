require_relative 'test_helper.rb'
require_relative '../lib/typoglycaemic.rb'


class TypoTest < Minitest::Test

  def setup
    @words = <<~STR
      According to a researcher at Cambridge University, it doesn't matter in what order the letters in a word are, the only important thing is that the first and last letter be at the right place. The rest can be a total mess and you can still read it without problem. This is because the human mind does not read every letter by itself but the word as a whole.
  	STR
  	  .strip
    @first_and_last =  @words.split(" ").map{|word| [ word[0], word.match(/\w[[:punct:]]?$/)[0]  ] }
    @tc = Typoglycaemic(@words)
    @output = @tc.jumbled
  end

  def test_start_and_end_are_unchanged
    assert @output.split(/\s/).zip(@first_and_last)
                                .all?{|jumble,(first,last)|
      jumble[0] == first and jumble[-1*last.size..-1] == last
    }
  end


  def test_most_longer_words_are_scrambled
    longer_typos,longer_words =
      [@output, @words].map{|cohort|
        words = cohort.dup.split " "
        words.reject{|word| Typoglycaemic::BESIDES.include? word.downcase }
              .map{|word| word.gsub(/[[:punct:]]/, "")}
              .select{|word| word.size >= 4 }
      }
    zipped = longer_typos.zip(longer_words)
    zipped.delete_if{|(a,b)| b =~ /(?:([a-z])\1)/ }
    by_chance = (longer_typos.size * Typoglycaemic::DEFAULT_CHANCE.to_f/100)
    scrambled = zipped.select{|(typo,word)| typo != word }
    assert scrambled.size >= by_chance
  end


  def test_all_shorter_words_are_not_scrambled
    typos, words = [@output, @words].map{|cohort|
      cohort.dup.split(" ").select{|word| word.size <= 3 }
    }
    assert typos.zip(words).all?{|(typo,word)| typo == word }
  end


  def test_the_input_is_same_length_as_the_output
    assert_equal @output.size, @words.size
  end


  def test_every_word_is_same_length
    assert @output.split(" ").zip(@words.split(" ")).all?{|(a,b)| a.size == b.size }
  end


  def test_the_original_is_unchanged
    assert @tc.original == @words
  end


  def test_original_is_preserved_if_already_typoglycaemized
    assert Typoglycaemic(@tc).original == @words
  end


  def test_jumbled_is_preserved_if_already_typoglycaemized
    assert Typoglycaemic(@tc).jumbled == @output
  end


  def test_it_says_it_is_frozen_and_it_is
    assert @tc.frozen && @tc.original.frozen? && @tc.jumbled.frozen?
  end
end