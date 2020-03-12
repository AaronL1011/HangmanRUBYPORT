# HangmanRUBY

A ruby ported version of my Python Hangman.
Done for a project for Coder Academy.

### Instructions and Help

Ensure ruby is installed on your machine, and you have all the dependencies installed as listed below:
```
gem install tty
gem install random-word-generator
gem install colorize
gem install lolcat
```

Navigate to directory of game in terminal and run with ruby.
```
ruby main.rb
```

## Software Development Plan

### Application Purpose and Scope

This application aims to provide an efficient, console based way to play everyones favourite game, HANGMAN! Sitting behind a desk all day staring at lines of code, scrolling through documentation, skimming emails and ignoring bug tickets can take its toll on a developers mind. We need a way to break free of the grasp of our daily responsibilities, and so, I will develop this excellent excuse to waste time. __HangmanRUBY is being developed to fill in idle time behind the office desk, and provide users with a way to keep their brain working while still having fun and minimising resource usage on the machine in question, allowing it to be kept running in the background for easy switching between real work and hangman, with no impact to performance.__ This allows employees to keep momentum if they are waiting on tasks to be completed and don't want to break their flow. __Ideally the target audience for this project will be for any english speaking developer (with the ability to include more languages in the future), as well as being appropriate for all ages, ensuring the words are not vulgar.__ From a visual point of view this program should be appealing to look at, to give our eyes a break from the normal code we glare at 24/7. Functionally, it should be able to randomly select a word from the english language and include the ability for the user to input guesses until they figure out what the word is. For every incorrect guess, the hangman will draw an extra element on the screen, until he is fully drawn and the game is over. Initially this program will be executed from the terminal via the 'ruby' command, however once the project is complete I would like to make the project into a cross-platform executable file to expand the target audience outside of developers with knowledge of the CLI. User input is handled as either single alphanumeric characters, or entire words, followed by the enter key. Navigation of the title screen and menus is done with the arrow and enter keys.

### Features

**Appealing UI**

A large goal for this project is to take the CLI applications away from the traditional line by line text controlled programs. To do this, I plan to make an almost GUI/CLI hybrid, with appealing title screens, cursor selectable menu items and smooth transitions / overall polishing between each function of the game. In order to do this, I'm planning on utilizing the ruby gem TTY. This package includes many tools to allow me to create the user interface intended, such a combination of TTY-prompt and ASCII which will prove crucial to the generation of a visually appealing application. Between scenes ive added a loading screen with an animated spinning icon to smooth out the time needed for processing. Ive used some generic ascii along with the Colorize gem to create a pretty nice looking banner for the Title screen, along with some smaller ascii for titles during the game play. As for the win screen, I went with some cool ascii fireworks to celebrate the users victory. If they lose, well, I thought an ascii skull was appropriate seeings you just misspelled a man to death...

![Title Screenshot](/img/menu_screenshot.png)

**Random Word Selection**

Basically the entire premise of hangman is based around the selection of a random word. Originally I handled this as a .txt file that contained lines of english words that I inputed myself, the program would reference this file and choose a random word from the list. Thankfully someone has created a ruby gem called random-word-generator, which has the ability to generate strings of dictionary words, allowing for specification of the number of words, length of strings and the seperator. This seems like a much nicer, more integrated way to select words for the user to guess, whilst also restricting my ability as the creator of the project to know which words could be chosen. I created a variable name wordToGuess, and set it to be assigned to the RandomWordGenerator.word method, which works great. Unfortunetly some of the words that get selected are very difficult, but hey, its an excuse to expand your vocabulary I guess.

![Random Word Generator Gem](/img/random-words.png)

**Sounds**

A feature I think would be really cool to implement is the idea of sounds for the game. This will include different pieces of retro game music for the title screen, during gameplay, and sound chimes when you win or lose. I think ill be able to accomplish this with the inbuilt fork/exec methods, which allow ruby programs to execute inbuilt terminal commands such as 'afplay' which is what will be playing the music for the game. I did a search for a gem to handle the sounds, but was unable to find one which was suitable, so 'afplay' will have to do for now. After tinkering for a while, I managed to write methods to play and stop music. One issue I found is if you stop/start music too close to eachother, it will bug out and wont start the next song. To remedy this I created doSpinner(), acting as a loading screen between scenes, allowing time for killing one music process, and starting another. This was a pretty clean solution to an annoying problem. In order to toggle music on and off globally within the game, I created the $music boolean variable, along with the cancelMusic() function. When $music is true, every method to start song instances will go ahead on each scene load, otherwise if it is set to false, it will be ignored and the scene will continue without music. cancelMusic() kills music processes if $music is true. If $music was false and the kill process tried to run, it throws an error and breaks the program.

## User Interaction

The controls of this program are very intuitive, enter letter or word, press return, so detailed instructions of how to play arent crucial, regardless, Ive made sure that the basics are included. On first execution, the TTY-prompt includes initial instructions about menu control (see below), which saves me some work and is quite tidy. 

![Menu Prompt](/img/Menu_Prompt.png)

As for the gameplay, once the game has begun, the program prints a line asking for user input, and stating valid input types (single characters or whole words). 

![Guess Prompt](/img/Guess.png)

If a user enters a guess that has already been tried, the program will output the string "You've already tried that!" and prompt for another input. 

![Menu Prompt](/img/already_guessed.png)

If the user inputs nothing, or a blank character, the program will ask for a valid input and wait for the next entry.

![Menu Prompt](/img/enter_a_guess.png)

## Control Flow

![Control Flow Diagram](/img/control_flow.jpg)

## Implementation Plan

In order to complete this project by its due date on the 13th of May 2020, I need to create a structure of all elements of the program and documentation to aid me in staying on track, and not forgetting features or testing. I have decided to use GitHubs built-in "Projects" feature to create a job board, where I am able to create tasks and sort them by TODO, In Progress and Done.  Main features to be developed include: 

1. Main Game Process (Winning and Losing)
    1. Using the random-word-generator gem to set a word to guess
    1. Creating the game loop to run until the user has guessed the word, or ran out of guesses.
    1. Create arrays to store a split version of the "Word to Guess", any incorrect guesses, and current correctly guessed letters.
    1. User inputs for guesses
    1. Win function when user guesses the word correctly.
    2. Lose function when user runs out of guesses.

1. Title Screen
    1. Arrow key controllable menu selections
    1. Visually appealing heading
    1. Options for play, music on/off, credits and quit.
1. Soundtrack
    1. Sepereate tracks for the title screen, game screen and win/loss screens.
    1. Settings to disable music (globally applied).
1. Credit Screen
    1. Screen to display program author, github link.
    1. Make it look cool.
1. All the documentation

![Project Board One](/img/Screenshot_1.png)
![Project Board Two](/img/Screenshot_2.png)
![Project Board Three](/img/Screenshot_3.png)


## Testing

Testing for this application was done manually by myself, classmates and my roommates. Results were recorded in a test case spreadsheet as below:

![Test Case Spreadsheet](/img/testing.png)
(All issues fixed in final presentation, left screenshot as is becasue all green tests is boring.)

