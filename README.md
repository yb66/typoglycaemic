# Typoglycaemic

## Usage

```ruby
require 'typoglycaemic'
```


```ruby
words = <<~STR
According to a researcher at Cambridge University, it doesn't matter in what order the letters in a word are, the only important thing is that the first and last letter be at the right place. The rest can be a total mess and you can still read it without problem. This is because the human mind does not read every letter by itself but the word as a whole.
STR

puts Typoglycaemic(words)
```ruby

> Accorindg to a reeascrehr at Cmbairdge Uivnesrtiy, it deso'nt matter in what order the letters in a word are, the only ipmortnat tinhg is that the fisrt and last letter be at the rgiht pacle. The rset can be a toatl mses and you can still raed it wtiouht poblerm. Tihs is bceasue the huamn mnid does not read eevry letter by iteslf but the wrod as a wolhe.

```ruby
str = "A doctor has admitted the manslaughter of a teenage cancer patient who died after a hospital drug blunder."
puts Typoglycaemic(str)
```

> A docotr has amditted the mnsalugather of a teengae cnaecr ptiaent who died after a hspotail drug blnduer.

```ruby
str = "In the Victorian era, a lovely emerald green, partially formulated from arsenic, was used in fabrics and popular floral headdresses."
puts Typoglycaemic(str)
```

> In the Vitorcain era, a lovley emreald green, patirally fromlauetd form asenric, was uesd in fbarics and poplaur folarl headdersses.


## The rules

It follows the rules set out [in this article](https://www.dictionary.com/e/typoglycemia/).


## Why this library?

Mainly because I was getting bored of debugging and wanted to do something else, but also because I read this:

> In a final study, Gervais and Norenzayan used an even more subtle way of activating analytic thinking: by having participants fill out a survey measuring their religious beliefs that was printed in either clear font or font that was difficult to read. Prior research has shown that difficult-to-read font promotes analytic thinking by forcing participants to slow down and think more carefully about the meaning of what they are reading. The researchers found that participants who filled out a survey that was printed in unclear font expressed less belief as compared to those who filled out the same survey in the clear font.

[How Critical Thinkers Lose Their Faith in God, Daisy Grewal, May 1, 2012, Scientific American](https://www.scientificamerican.com/article/how-critical-thinkers-lose-faith-god/)

I might try using it on social networks when I want my "opponent" in a debate to bypass "System 1".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'typoglycaemic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typoglycaemic


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yb66/typoglycaemic.
