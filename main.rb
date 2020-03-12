# Requirements
require_relative "./draw.rb"
require 'tty-prompt'
require 'random_word_generator'
require 'colorize'
require 'lolcat'
require 'tty-spinner'
$music = true
windowSize = fork{ exec 'printf', "\e[8;27;105t"}

def titleScreen()
    if $music
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
        gameMain()
    elsif menuChoice == "Credits"
        puts `clear`
        credits()
    elsif menuChoice == "Toggle Music"
        if $music
            stopMusic = fork{exec 'killall', 'afplay'}
            $music = false
        elsif !$music
            $music = true
        end
        titleScreen()
    elsif menuChoice == "Quit"
        cancelMusic()
        puts `clear`
        exit!
    end
end

def gameMain()
    if $music
        gameMusic = fork{ exec 'afplay', "./music/vampirekillerLong.mp3" }
    end
    puts drawHeader()
    #initialize the randomly selected word to guess
    wordToGuess = RandomWordGenerator.word
    # wordToGuess = "testing"
    wordToGuess = wordToGuess.upcase
    wordToGuessArray = wordToGuess.split("")
    wordToGuessIndexReference = wordToGuess.split("")
    puts("A word has been chosen...")
    puts("\n")
    #initialize variables required
    errorCount = 0
    wrongLetters = []
    correctLetters = ["_"] * (wordToGuessArray.length)
    #main game start
    print(correctLetters)
    puts("\n"*2)
    while correctLetters != wordToGuessArray && errorCount < 10
        print("Enter a guess! (single character or whole word): ")
        guess = gets.chomp
        guess = guess.upcase
        if guess == "<MENU>"
            cancelMusic()
            titleScreen()
        end
        if wordToGuessArray.include?(guess) &&  !correctLetters.include?(guess)
            for c in wordToGuessArray
                if c == guess
                    correctLetters[wordToGuessIndexReference.index(guess)] = guess
                    wordToGuessIndexReference[wordToGuessIndexReference.index(guess)] = "0"
                end
            end
            drawScreen(errorCount, wrongLetters, correctLetters)
        elsif correctLetters.include?(guess) || wrongLetters.include?(guess)
            drawScreen(errorCount, wrongLetters, correctLetters)
            puts "You've already guessed that!"
        elsif guess == "" || guess == "\s"
            drawScreen(errorCount, wrongLetters, correctLetters)
            puts("Please enter a guess!")
        elsif guess.upcase == wordToGuess
            break #break while loop when user guesses entire corrent word.
        else
            errorCount += 1
            wrongLetters.push(guess)
            drawScreen(errorCount, wrongLetters, correctLetters)
        end
    end

    if errorCount != 10
        playerWin(wordToGuessArray)
    else
        playerLose(wordToGuessArray)
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
    puts("Incorrect Guesses:")
    print(wrongLetters)
    puts("\n"*2)
end

def playerWin(correctWord)
    cancelMusic()
    puts `clear`
    doSpinner()
    puts `clear`
    if $music
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
    if $music
        victorySong = fork{ exec 'afplay', "./music/gameover.mp3" }
    end
    drawLoser(correctWord)
    sleep(5)
    titleScreen()
end

def credits()
    puts "\n\n\n"
    fork{exec 'lolcat -a -d 4 credits.plaintext'}

    puts "\nPress enter to return."
    gets
    cancelMusic()
    doSpinner()
    titleScreen()
end

def doSpinner()
    spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :dots)
    spinner.auto_spin
    sleep(2)
    spinner.stop
end

def cancelMusic()
    if $music
        stopMusic = fork{ exec 'killall', 'afplay'}
    end
end

titleScreen()