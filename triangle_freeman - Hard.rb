########################################################################################################
#
#  Name:        Timbre Freeman
#  Assignment:  Right Triangle
#  Date:        09/30/2019
#  Class:       CIS 282
#  Description: Make right triangles using * or numbers and have the user set the size of the triangle
#
########################################################################################################


# Welcome screen
puts "#################################"
puts "#Welcome to Right Triangle Maker#"
puts "#################################"
# repeat the program in tell told other wise
run_program = true
while run_program
  # Menu
  # Ask the user for type of triangle
  puts "(1) for a right triangle using *"
  puts "(2) for a right triangle using numbers"
  puts "(3) for a flip right triangle using *"
  puts "(4) to exit"
  print "Enter a opinion: "
  user_opinion = gets.chomp.to_i
  puts ""
  # Check if they pick a opinion other than exit
  if ((user_opinion < 4) && (user_opinion >= 1))
    # Ask user for size of the triangle
    print "Enter the size of the triangle: "
    triangle_size = gets.chomp.to_i
    puts ""

    # example size 5
    # (1)
    # |  |*|s|s|s|s|
    # |  |*|*|s|s|s|
    # i  |*|s|*|s|s|
    # |  |*|s|s|*|s|
    # |  |*|*|*|*|*|
    # ------j---------
    # (2)
    # |  |1| | | | |
    # |  |1|2| | | |
    # i  |1|2|3| | |
    # |  |1|2|3|4| |
    # |  |1|2|3|4|5|
    # ------j---------
    # (3) # shift (1) can allow us to make it look like we flip triangle
    # |  |S|S|S|S|*|s|s|s|s|
    # |  |S|S|S|*|*|s|s|s|
    # i  |S|S|*|s|*|s|s|
    # |  |S|*|s|s|*|s|
    # |  |*|*|*|*|*|
    # (4)
    # |  |s|s|*|s|s|
    # |  |s|*|s|*|s|
    # i  |*|s|s|s|*|
    # |  |s|*|s|*|s|
    # |  |s|s|*|s|s|
    # ------j---------

    # each line of the triangle
    for i in 1..triangle_size
      # each char in the line
      for j in 1..triangle_size
        # check if it is opinion 1
        # check if it is opinion 3 as well to shift
        if (user_opinion == 1 || user_opinion == 3)
          # do it one per line and check if it is opinion 3
          if (j == 1 && user_opinion == 3)
            # add space to shift each line of the triangle
            print " "*(triangle_size-i)
          end
          # because the slop of the line is -1 the input and output of the math function will become the same
          # y = -1x
          # check if it is at one of the side of the triangle
          if (i == j || j == 1 || i == triangle_size)
            print "*"
          # if anything else add a space
          else
            print " "
          end
        # check if it is opinion 2
        elsif (user_opinion == 2)
          #if (j <= (triangle_size-(triangle_size-i))) --> if (j <= triangle_size-triangle_size+i) --> if (j <= i)
          if (j <= i)
            print "#{j}"
          end
        end
      end
      puts ""
    end
    puts ""
  else
    # Check if they pick a opinion not not part of the list of opinion's
    if (user_opinion != 4)
      puts "incorrect input - exiting program"
    end
    run_program = false
  end
end
if (user_opinion == 4)
  puts "Have a good day"
end