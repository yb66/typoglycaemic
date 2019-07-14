# Jumble words in a typoglycaemic fashion.
class Typoglycaemic
  class Error < StandardError; end

  # Ignore these functional words.
  BESIDES = %w{a and at be by it on the to}

  # The chance of a pair of letters being jumbled is 50/50.
  DEFAULT_CHANCE = 50


  # @example
  #   str = "In the Victorian era, a lovely emerald green, partially formulated from arsenic, was used in fabrics and popular floral headdresses."
  #   puts Typoglycaemic(str)
  #   > In the Vitorcain era, a lovley emreald green, patirally fromlauetd form asenric, was uesd in fbarics and poplaur folarl headdersses.
  #
  # @param [String] original
  def initialize original
    if original.respond_to?(:typoglycaemized)
      @original = original.original
      @typoglycaemized = original.typoglycaemized
    else
      @original = original
      @chance = DEFAULT_CHANCE
      @typoglycaemized = self.class.typoglycaemize @original, @chance
    end
    @original.freeze and @typoglycaemized.freeze and @frozen = true
  end

  # @return [String]
  attr_reader :typoglycaemized, :original, :frozen

  # because that's a mouthful
  alias_method :jumbled, :typoglycaemized


  class << self

    # @param [String] original
    # @param [Integer] chance
    def typoglycaemize original, chance
      if original =~ /\s/
        original.split(/\s/).map{|word|
          if word.size <= 3 or BESIDES.include?(word.downcase)
            word
          else
            to_typo( word, chance)
          end
        }.join(" ")
      else
        to_typo original, chance
      end
    end


    # Regex to partition by.
  	PATTERN = /
  	  (?:
  	    (?<=\b)\s           # end of a word
  	  )
  	    |
  	  (?:
  	    [[:punct:]](?=\s)   # punctuation at the end of a word
  	  )
  	    |
  	  (?:
  	    ([a-z])\1           # repeated letters
  	  )
  	/x

    # @api private
    # @see #typoglycaemize
    def to_typo original, chance
      h,*middle,t = original.split //
      newstring = h
      t ||= ""
      t = middle.delete_at(-1) + t if /[[:punct:]]/ =~ t

      middle = middle.join
      middle.size >= 7 ?  chance -= 10 : chance += 10

      until middle.empty?
        head,wall,tail = middle.partition PATTERN
        head = head.split //
        # use an external iterator as the array is being mutated.
        for i in 0..head.size-1 do
          if b = head[i+1] # control the jumbling
            # as it gets more jumbled the chance of being jumbled
            # goes down
            if rand(0..99) < chance              
              a = head[i]
              head[i] = b
              head[i+1] = a
              chance -= 10 unless chance <= 10
            else
              # and goes up if less jumbled
              chance += 10 unless chance >= 90
            end
          end
        end
        newstring << head.join
        newstring << wall
        middle = tail
      end
      newstring << t
    end

  end

end


# For convenience.
# @param [Typoglycaemic,String] original
# @return [Typoglycaemic]
def Typoglycaemic(original)
  Typoglycaemic.new(original)
end
