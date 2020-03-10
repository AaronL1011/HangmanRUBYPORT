require 'tty-box'
require 'tty-screen'

print TTY::Box.frame "Hello world!"

# box = TTY::Box.frame(
#     width: TTY::Screen.width, 
#     height: TTY::Screen.height-1,
#     title: {top_left: '|HangmanRUBY|', bottom_right: '(v1.0)'},
#     border: :thick,
#     style: {
#         bg: :cyan})
box = TTY::Box.frame(width: TTY::Screen.width,height: TTY::Screen.height-1, align: :center, padding: 3) do
    "    _____"
    "    |   |"
    "    o   |"
    "   /|\\  |"
    "    /\\  |"
    "        |"
    "  -------------"
  end
print box