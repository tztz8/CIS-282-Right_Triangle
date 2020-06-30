########################################################################################################
#
#  Name:        Timbre Freeman
#  Assignment:  Right Triangle
#  Date:        09/30/2019
#  Class:       CIS 282
#  Description: Make right triangles using * or numbers and have the user set the size of the triangle
#
########################################################################################################

def value_at x
  return (x * (-$triangle_r_slop)) + $triangle_height
end

def triangle debug
  for i in 0..$triangle_height
    for j in 0..$triangle_width
      print "#{(value_at(j))%1}  " if (debug)
      if ((0 == (value_at(j))%1) || (j == 1))
        print "*"
      elsif (i == $triangle_height)
        print "*"
      else
        print " "
      end
    end
    puts ""
  end
end


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
    print "Enter the height of the triangle: "
    $triangle_height = gets.chomp.to_i
    puts ""
    print "Enter the width of the triangle: "
    $triangle_width = gets.chomp.to_i
    puts ""
    $triangle_r_slop = $triangle_width.to_f / $triangle_height.to_f
    puts format("%.3f", $triangle_r_slop)
    triangle true
    triangle false
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