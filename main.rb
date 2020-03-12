# Requirements
require_relative "./draw.rb"
require 'tty-prompt'
require 'random_word_generator'
require 'colorize'
require 'lolcat'
require 'tty-spinner'
$enableMusic = true
windowSize = fork{ exec 'printf', "\e[8;27;105t"}

def titleScreen()
    if $enableMusic
        titleMusic = fork{ exec 'afplay', "./music/title.mp3" }
    end
    puts `clear`
    puts drawTitle().colorize(:red)
    prompt = TTY::Prompt.new
    menuChoice = prompt.select("What would you like to do?", ["Play Hangman", "Credits", "Toggle Music", "Quit"])
    if menuChoice == "Play Hangman"
        cancelMusic()
        puts `clear`
        doSpinner()
        puts `clear`
        playGame()
    elsif menuChoice == "Credits"
        puts `clear`
        credits()
    elsif menuChoice == "Toggle Music"
        if $enableMusic
            stopMusic = fork{exec 'killall', 'afplay'}
            $enableMusic = false
        elsif !$enableMusic
            $enableMusic = true
        end
        titleScreen()
    elsif menuChoice == "Quit"
        cancelMusic()
        puts `clear`
        exit!
    end
end

def playGame()
    if $enableMusic
        gameMusic = fork{ exec 'afplay', "./music/vampirekillerLong.mp3" }
    end
    puts drawHeader().colorize(:red)
    wordToGuess = RandomWordGenerator.word # Assign random word from API to wordToGuess variable.
    # wordToGuess = "testing"
    wordToGuess = wordToGuess.upcase #Initiate all the variables required for gameplay.
    wordToGuessArray = wordToGuess.split("")
    wordToGuessIndexReference = wordToGuess.split("")
    puts("A word has been chosen...")
    puts("\n")
    errorCount = 0
    wrongLetters = []
    correctLetters = ["_"] * (wordToGuessArray.length)
    print(correctLetters)
    puts("\n"*2)
    while correctLetters != wordToGuessArray && errorCount < 10
        print("Enter a guess! (single character or whole word): ")
        guess = gets.chomp
        guess = guess.upcase
        if guess == "<MENU>" #Sneaky input to return to main menu. Do I inform the user? Do I not? Who knows...
            cancelMusic()
            titleScreen()
        end
        if wordToGuessArray.include?(guess) &&  !correctLetters.include?(guess) #If character entered is in the wordToGuess Array, and hasn't already been guessed
            for c in wordToGuessArray                                           # add to correctLetters array at appropriate indexes.
                if c == guess
                    correctLetters[wordToGuessIndexReference.index(guess)] = guess
                    wordToGuessIndexReference[wordToGuessIndexReference.index(guess)] = "0"
                end
            end
            drawScreen(errorCount, wrongLetters, correctLetters)
        elsif correctLetters.include?(guess) || wrongLetters.include?(guess) #Guess previously attempted, return prompt to enter a new guess.
            drawScreen(errorCount, wrongLetters, correctLetters)
            puts "You've already guessed that!"
        elsif guess == "" || guess == "\s" #Empty input, return prompt to enter a guess.
            drawScreen(errorCount, wrongLetters, correctLetters)
            puts("Please enter a guess!")
        elsif guess.upcase == wordToGuess #User guessed entire word, break loop.
            break
        else #Incorrect guess, add guess to incorrectGuesses, increase errorCount by one, redraw screen.
            errorCount += 1
            wrongLetters.push(guess)
            drawScreen(errorCount, wrongLetters, correctLetters)
        end
    end

    if errorCount != 10 #If user didnt reach max guesses by the time previous loop breaks, player wins. Otherwise, player loses.
        playerWin(wordToGuessArray)
    else
        playerLose(wordToGuessArray)
    end
end

def drawScreen(errorCount, wrongLetters, correctLetters)
    puts `clear`
    puts drawHeader().colorize(:red)
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
    puts("Incorrect Guesses:")
    print(wrongLetters)
    puts("\n"*2)
end

def playerWin(correctWord)
    cancelMusic()
    puts `clear`
    doSpinner()
    puts `clear`
    if $enableMusic
        victorySong = fork{ exec 'afplay', "./music/victory.mp3" }
    end
    drawVictory(correctWord)
    sleep(5)
    titleScreen()
end

def playerLose(correctWord)
    cancelMusic()
    puts `clear`
    doSpinner()
    puts `clear`
    if $enableMusic
        victorySong = fork{ exec 'afplay', "./music/gameover.mp3" }
    end
    drawLoser(correctWord)
    sleep(5)
    titleScreen()
end

def credits()
    fork{exec 'lolcat -a -d 4 credits.plaintext'}
    puts "\nPress enter to return."
    gets #pause until user hits enter.
    cancelMusic()
    doSpinner()
    titleScreen()
end

def doSpinner()
    spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :dots)
    spinner.auto_spin
    sleep(1)
    spinner.stop
end

def cancelMusic()
    if $enableMusic
        stopMusic = fork{ exec 'killall', 'afplay'}
    end
end

titleScreen()