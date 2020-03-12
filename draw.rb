
def drawEnd()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("   /|\\  |")
    puts("    /\\  |")
    puts("        |")
    puts("  -------------")
end


def drawNine()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("   /|\\  |")
    puts("    /   |")
    puts("        |")
    puts("  -------------")
end

def drawEight()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("   /|\\  |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawSeven()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("   /|   |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawSix()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("    |   |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawFive()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawFour()
    puts("    _____")
    puts("    |   |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawThree()
    puts("    _____")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawTwo()
    puts("         ")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("        |")
    puts("  -------------")
end

def drawStart()
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("  -------------")
end

def drawNone()
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("         ")
    puts("               ")
end


def drawTitle()
" ██╗░░██╗░█████╗░███╗░░██╗░██████╗░███╗░░░███╗░█████╗░███╗░░██╗██████╗░██╗░░░██╗██████╗░██╗░░░██╗
 ██║░░██║██╔══██╗████╗░██║██╔════╝░████╗░████║██╔══██╗████╗░██║██╔══██╗██║░░░██║██╔══██╗╚██╗░██╔╝
 ███████║███████║██╔██╗██║██║░░██╗░██╔████╔██║███████║██╔██╗██║██████╔╝██║░░░██║██████╦╝░╚████╔╝░
 ██╔══██║██╔══██║██║╚████║██║░░╚██╗██║╚██╔╝██║██╔══██║██║╚████║██╔══██╗██║░░░██║██╔══██╗░░╚██╔╝░░
 ██║░░██║██║░░██║██║░╚███║╚██████╔╝██║░╚═╝░██║██║░░██║██║░╚███║██║░░██║╚██████╔╝██████╦╝░░░██║░░░
 ╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░╚═════╝░╚═════╝░░░░╚═╝░░░\n\n"
end

def drawHeader()
"█░█ ▄▀█ █▄░█ █▀▀ █▀▄▀█ ▄▀█ █▄░█ █▀█ █░█ █▄▄ █▄█
█▀█ █▀█ █░▀█ █▄█ █░▀░█ █▀█ █░▀█ █▀▄ █▄█ █▄█ ░█░\n\n"
end

def drawVictory(correctWord)
puts "
            '.         |    |      '       |   '     *
              \\*        \\   \\             /
    '          \\     '* |    |  *        |*                *  *
         *      `.       \\   |     *     /    *      '
.                  \\      |   \\          /               *
  *'  *     '      \\      \\   '.       |
     -._            `                  /         *
' '      ``._   *                           '          .      '
*           *\\*          * .   .      *
*  '        *    `-._       You Win!!         .         _..:='        *
          .  '      *       *    *   .       _.:--'
       *           .     .     *         .-'         *
.               '             . '   *           *         .
*       ___.-=--..-._     *                '               '
                               *       *
             *        _.'  .'       `.        '  *             *
  *              *_.-'   .'            `.               *
                .'                       `._             *  '
'       '                        .       .  `.     .
    .                      *                  `
            *        '             '                          .
"
print("         " + correctWord.to_s + "\n\n")
end

def drawLoser(correctWord)
    puts "
                _,.-------.,_
            ,;~'             '~;,
           ,;                     ;,
          ;                         ;
         ,'        YOU LOSE!         ',
         ,;                           ;,
         ; ;      .           .      ; ;
        | ;   ______       ______   ; |
        |  `/~\"     ~\" . \"~     \"~\'   |
        |  ~  ,-~~~^~, | ,~^~~~-,  ~  |
         |   |        }:{        |   |
         |   l       / | \\       !   |
         .~  (__,.--\" .^. \"--.,__)  ~.
         |     ---;' / | \\ `;---     |
          \\__.       \\/^\\/       .__/
           V| \\                 / |V
            | |T~\\___!___!___/~T| |
            | |`IIII_I_I_I_IIII'| |
            |  \\,III I I I III,/  |
             \\   `~~~~~~~~~~'    /
               \\   .       .   /
                 \\.    ^    ./
                   ^~~~^~~~^
    \n"
    print("    " + correctWord.to_s + "\n\n")
end