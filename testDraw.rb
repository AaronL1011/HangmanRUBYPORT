def drawEnd()
    puts("    _____")
    puts("    |   |")
    puts("    o   |")
    puts("   /|\\  |")
    puts("    /\\  |")
    puts("        |")
    puts("  -------------")
end

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

    # if errorCount == 0
    #     drawNone()
    # elsif errorCount == 1
    #     drawStart()
    # elsif errorCount == 2
    #     drawTwo()
    # elsif errorCount == 3
    #     drawThree()
    # elsif errorCount == 4
    #     drawFour()
    # elsif errorCount == 5
    #     drawFive()
    # elsif errorCount == 6
    #     drawSix()
    # elsif errorCount == 7
    #     drawSeven()
    # elsif errorCount == 8
    #     drawEight()
    # elsif errorCount == 9
    #     drawNine()
    # end