puts "Enter a valid name:"
name = ""
while !name.match(/^[[:alpha:]]+$/)
    name = gets.chomp
    if !name.match(/^[[:alpha:]]+$/)
        puts "Please enter a valid name."
    end
end

puts name + " is valid."