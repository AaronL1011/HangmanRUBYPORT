# Requirements
require_relative "./draw.rb"
require_relative "./ErrorHandling.rb"
require "tty-prompt"
require 'random_word_generator'
#pid = fork{ exec 'afplay', "./vampirekillerLong.mp3" }

def titleScreen()
    puts `clear`
    prompt = TTY::Prompt.new
    menuChoice = prompt.select("What would you like to do?", ["Play Hangman", "Secret Surprise", "Stop Music", "Quit"])
    if menuChoice == "Play Hangman"
        puts `clear`
        gameMain()
    elsif menuChoice == "Secret Surprise"
        puts `clear`
        puts "Dicks"
    elsif menuChoice == "Stop Music"
        pid = fork{exec 'killall', 'afplay'}
        titleScreen()
    elsif menuChoice == "Quit"
        pid = fork{exec 'killall', 'afplay'}
    end
end

def gameMain()
    #initialize the randomly selected word to guess
    wordToGuessSTRING = RandomWordGenerator.word
    # wordToGuessSTRING = "testing"
    wordToGuessSTRING = wordToGuessSTRING.upcase
    wordToGuess = wordToGuessSTRING.split("")
    wordToGuess2 = wordToGuessSTRING.split("")
    puts("A word has been chosen...")
    puts("\n")
    #initialize variables requireda
    errorCount = 0
    wrongLetters = []
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
        elsif correctLetters.include?(guess) || wrongLetters.include?(guess)
            alreadyGuessed(correctLetters, wrongLetters, guess)
        elsif guess == "" || guess == "\s"
            puts("Please enter a guess!")
        elsif guess.upcase == wordToGuessSTRING
            break #break while loop when user guesses entire corrent word.
        else
            errorCount += 1
            wrongLetters.push(guess)
        end
        
        drawScreen(errorCount, wrongLetters, correctLetters)
    end

    if errorCount != 10
        puts `clear`
        print(wordToGuess.to_s + "\n\n")
        puts("CONGRATS! YOU WON!")
    else
        puts `clear`
        drawEnd()
        print(wordToGuess.to_s+"\n\n")
        puts("Damn, you lost! Better luck next time.")
    end
end
def drawScreen(errorCount, wrongLetters, correctLetters)
    puts `clear`
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
    print(wrongLetters)
    puts("\n")
end
def playerWin(correctWord)
    puts "You win!"
end
def playerLose(correctWord)
    puts "You suck!"
end
def ErrorHandle()
end

titleScreen()