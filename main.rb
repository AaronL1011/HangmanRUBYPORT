# Requirements
require_relative "./draw.rb"
require_relative "./ErrorHandling.rb"
require 'tty-prompt'
require 'random_word_generator'
require 'colorize'
require 'artii'
require 'lolcat'
require 'tts'
require 'tty-spinner'
windowSize = fork{ exec 'printf', "\e[8;24;105t"}
def titleScreen()
    titleMusic = fork{ exec 'afplay', "./music/title.mp3" }
    puts `clear`
    puts drawTitle().colorize(:red)

    prompt = TTY::Prompt.new
    menuChoice = prompt.select("What would you like to do?", ["Play Hangman", "Credits", "Stop Music", "Quit"])
    if menuChoice == "Play Hangman"
        puts `clear`
        stopMusic = fork{exec 'killall', 'afplay'}
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :dots)
        spinner.auto_spin
        sleep(2)
        spinner.stop
        puts `clear`
        gameMain()
    elsif menuChoice == "Credits"
        puts `clear`
        credits()
    elsif menuChoice == "Stop Music"
        stopMusic = fork{exec 'killall', 'afplay'}
        titleScreen()
    elsif menuChoice == "Quit"
        stopMusic = fork{exec 'killall', 'afplay'}
        exit!
    end
end

def gameMain()
    gameMusic = fork{ exec 'afplay', "./music/vampirekillerLong.mp3" }
    #initialize the randomly selected word to guess
    # wordToGuessSTRING = RandomWordGenerator.word
    wordToGuessSTRING = "testing"
    # wordToGuessSTRING = "testing"
    wordToGuessSTRING = wordToGuessSTRING.upcase
    wordToGuess = wordToGuessSTRING.split("")
    wordToGuess2 = wordToGuessSTRING.split("")
    puts drawHeader()
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
        if guess == "<MENU>"
            stopMusic = fork{exec 'killall', 'afplay'}
            titleScreen()
        end
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
        playerWin(wordToGuess)
    else
        playerLose(wordToGuess)
    end
end

def drawScreen(errorCount, wrongLetters, correctLetters)
    puts `clear`
    puts drawHeader()
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
    puts `clear`
    backgroundMusic = fork{ exec 'killall', 'afplay'}
    sleep(1)
    victorySong = fork{ exec 'afplay', "./music/victory.mp3" }
    drawVictory(correctWord)
    sleep(5)
    titleScreen()
end

def playerLose(correctWord)
    puts `clear`
    drawEnd()
    print(correctWord.to_s+"\n\n")
    puts("Damn, you lost! Better luck next time.")
    "You suck. You lost. Why dont you get a dictionary and try again.".play
    sleep(5)
    titleScreen()
end

def credits()
end

titleScreen()