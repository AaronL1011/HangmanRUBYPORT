# Requirements

"""
word to guess
array for disguised word
Current errors:
Guesses left: 10

"""
  
require "active_support"
require_relative "./draw.rb"
wordGuessList = File.readlines('guessingWords.txt')

def gameMain(wordGuessList)
    #initialize the randomly selected word to guess
    wordToGuessSTRING = wordGuessList[rand(wordGuessList.length)].chomp
    # wordToGuessSTRING = "testing"
    wordToGuessSTRING = wordToGuessSTRING.upcase
    wordToGuess = wordToGuessSTRING.split("")
    wordToGuess2 = wordToGuessSTRING.split("")
    puts("A word has been chosen...")
    puts("\n")
    #initialize variables requireda
    errorCount = 0
    missedLetters = []
    correctLetters = ["_"] * (wordToGuess.length)
    #main game start
    print(correctLetters)
    puts("\n")
    while correctLetters != wordToGuess && errorCount < 10
        print("Enter a guess!: ")
        guess = gets.chomp
        guess = guess.upcase
        if wordToGuess.include?(guess) &&  !correctLetters.include?(guess)
            for c in wordToGuess
                if c == guess
                    correctLetters[wordToGuess2.index(guess)] = guess
                    wordToGuess2[wordToGuess2.index(guess)] = "0"
                end
            end
        elsif correctLetters.include?(guess)
            puts("You already guessed that!")
        else
            errorCount += 1
            missedLetters.push(guess)
        end
        
        drawScreen(errorCount, missedLetters, correctLetters)
    end

    if errorCount != 10
        puts("\n"*30)
        print(wordToGuess.to_s + "\n\n")
        puts("CONGRATS! YOU WON!")
    else
        puts("\n"*30)
        drawEnd()
        print(wordToGuess.to_s+"\n\n")
        puts("Damn, you lost! Better luck next time.")
    end
end
def drawScreen(errorCount, missedLetters, correctLetters)
    puts("\n"*30)
    case errorCount
    when 0
        drawNone()
    when 1
        drawStart()
    when 2
        drawTwo()
    when 3 
        drawThree()
    when 4
        drawFour()
    when 5
        drawFive()
    when 6
        drawSix()
    when 7
        drawSeven()
    when 8
        drawEight()
    when 9
        drawNine()
    end
    puts("\n"+"________________________________________\n\n")
    puts("Current Word:")
    print(correctLetters)
    puts("\n"*2)
    puts("Missed Letters:")
    print(missedLetters)
    puts("\n")
end

puts("Welcome to Hangman!")
gameMain(wordGuessList)
    
