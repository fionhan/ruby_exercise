module Flushcard

  class Application
    def initialize
      @decks=[]
    end

    def << deck
      @decks<<deck
    end

    def play
      display_decks
      puts "choose one deck :"
      deck=get_deck
      deck.play
    end

    def display_decks
      @decks.each { |deck| puts deck.name }
    end

    def get_deck
      name=gets.chomp
      @decks.detect { |deck| deck.name==name }
    end
  end

  class Card
    #wrong code when evaluate
    #attr_accessor @front, @back
    attr_accessor :front, :back

    def initialize front, back
      @front=front
      @back=back
    end

    def correct? guess
      guess==@back
    end

    def play
      puts "#{front} >"
      guess=gets.chomp
      if correct? guess
        puts "Correct"
      else
        puts "Incorrect, the name is #{back}"
      end
    end
  end

  class MutipleAnswerCard < Card
    def correct? guess
      answers=@back.split(",")
      answers.any? { |answer| answer==guess }
    end
  end

  class Deck
    attr_reader :cards, :name

    def initialize name
      @name=name
      @cards=[]
    end

    def << card
      @cards << card
    end

    def shuffle
      cards.shuffle!
    end

    def play
      shuffle
      #@cards.each{|card| card.play}
      @cards.each(& :play) #code in () will return a block
    end
  end
end

card1 = Flushcard::Card.new "cat", "neko"
card2 = Flushcard::Card.new "dog", "inu"
card3= Flushcard::Card.new "snake", "hero"
card4= Flushcard::Card.new "fish", "opps"

mutiple_answer_card=Flushcard::MutipleAnswerCard.new "bear", "bor,boor"

deck=Flushcard::Deck.new("Chinese")
deck<<card1<<card2
deck2=Flushcard::Deck.new("America")
deck2<<card3<<card4
deck3=Flushcard::Deck.new("Japanese")
deck3<<mutiple_answer_card
app=Flushcard::Application.new
app << deck << deck2<<deck3

app.play


