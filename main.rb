# Requirements
require_relative "./draw.rb"
require_relative "./ErrorHandling.rb"
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
    #initialize the randomly selected word to guess
    wordToGuessSTRING = RandomWordGenerator.word
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
            cancelMusic()
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
    cancelMusic()
    puts `clear`
    doSpinner()
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