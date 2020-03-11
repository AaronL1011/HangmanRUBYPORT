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
gem install artii
brew install mpg123
```

Navigate to directory of game in terminal and run with ruby.
`ruby main.rb`

## Software Development Plan

### Application Purpose and Scope

This application aims to provide an efficient, console based way to play everyones favourite game, HANGMAN! Sitting behind a desk all day staring at lines of code, scrolling through documentation, skimming emails and ignoring bug tickets can take its toll on a developers mind. We need a way to break free of the grasp of our daily responsibilities, and so, I will develop this excellent excuse to waste time. HangmanRUBY is being developed to fill in idle time behind the office desk, and provide users with a way to keep their brain working while still having fun and minimising resource usage on the machine in question, allowing it to be kept running in the background for easy switching between real work and hangman, with no impact to performance. This allows employees to keep momentum if they are waiting on tasks to be completed and don't want to break their flow. Ideally the target audience for this project will be for any english speaking developer (with the ability to include more languages in the future), as well as being appropriate for all ages, ensuring the words are not vulgar. From a visual point of view this program should be appealing to look at, to give our eyes a break from the normal code we glare at 24/7. Functionally, it should be able to randomly select a word from the english language and include the ability for the user to input guesses until they figure out what the word is. For every incorrect guess, the hangman will draw an extra element on the screen, until he is fully drawn and the game is over. Initially this program will be executed from the terminal via the 'ruby' command, however once the project is complete I would like to make the project into a cross-platform executable file to expand the target audience outside of developers with knowledge of the CLI. User input is handled as either single alphanumeric characters, or entire words, followed by the enter key. Navigation of the title screen and menus is done with the arrow and enter keys.

### Features

**Appealing UI**

A large goal for this project is to take the CLI applications away from the traditional line by line text controlled games we have seen in the past. To do this, I plan to make an almost GUI/CLI hybrid, with appealing title screens, cursor selectable menu items and smooth transitions / overall polishing between each function of the game. In order to do this, I'm planning on utilizing the ruby gem TTY. This package includes many tools to allow me to create the user interface intended, such as TTY-Prompt and TTY-Table which will prove crucial to the generation of a visually appealing application. 

**Random Word Selection**

Basically the entire premise of hangman is based around the selection of a random word. Originally I handled this as a .txt file that contained lines of english words that I inputed myself, the program would reference this file and choose a random word from the list. Thankfully someone has created a ruby gem called random-word-generator, which has the ability to generate strings of dictionary words, allowing for specification of the number of words, length of strings and the seperator. This seems like a much nicer, more integrated way to select words for the user to guess, whilst also restricting my ability as the creator of the project to know which words could be chosen.

**Sounds**

A feature I think would be really cool to implement is the idea of sounds for the game, mainly background music and possibly some text-to-speech for extra immersion. The inbuilt method 'afplay' seems like an effective way to do this, it is an inbuilt terminal based way to play audio clips. I can also use the 'tts' gem to integrate Google translate and enable the ability to use text-to-speech within the program. Id like to include some 8-bit background music within different screens (with the ability to mute), and have a text-to-speech process certain strings of text (eg. the title screen, win screens, loss screens, etc).

## User Interaction

## Control Flow

## Implementation Plan

