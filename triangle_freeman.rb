########################################################################################################
#
#  Name:        Timbre Freeman
#  Assignment:  Right Triangle
#  Date:        09/30/2019
#  Class:       CIS 282
#  Description: Make right triangles using * or numbers and have the user set the size of the triangle
#
########################################################################################################

# *      1          *    *
# **     12        **   * *
# * *    123      * *  *   *
# *  *   1234    *  *   * *
# *****  12345  *****    *

$debug = false

def print_array in_array
  for y in 0...in_array.length
    for x in 0...in_array.length
      print in_array[y][x]
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
  menu = [
      "for a right triangle using *",
      "for a right triangle using numbers",
      "for a diamond using triangle (odd numbers only)"
      ]
  # let the user know that they can reflect the chose later
  puts "Note that you can reflect you chose later"
  # Print the menu
  for i in 1..menu.length
    puts "(#{i}) #{menu[i-1]}"
  end
  # Print the exit
  puts "(#{menu.length+1}) to exit"
  # Ask the user
  print "Enter a opinion: "
  user_opinion = gets.chomp.to_i
  puts ""
  # Check if they pick a opinion other than exit
  if ((user_opinion < menu.length+1) && (user_opinion >= 1))
    # Ask user for size of the triangle
    print "Enter the size of the triangle: "
    triangle_size = gets.chomp.to_i
    # Check if the user input anything else
    if (triangle_size <= 0)
      puts "You have enter either 0 or something that is not a positive number, setting size to 5"
      triangle_size = 5
    end
    # Check if the value input is odd for the diamond
    if (user_opinion == 3 && triangle_size%2 != 1)
      triangle_size = triangle_size-1
      puts "Value must be odd, value is now #{triangle_size}"

    end
    puts ""
    # Ask user if they want to reflect the triangle
    if (user_opinion != 3)
      print "Do you want to reflect the triangle (Y/N): "
      user_opinion_reflect = gets.chomp.capitalize
    else
      user_opinion_reflect = "N"
    end
    if (user_opinion_reflect == "Y")
      triangle_reflect = true
    else
      if (user_opinion_reflect != "N")
        puts "incorrect input, you use #{user_opinion_reflect}, reflect will set to NO"
      end
      triangle_reflect = false
    end
    # keep debug separate from user's use
    puts triangle_size if ($debug == true)
    puts ""

    # set triangle screen so triangle_array[y][x]
    triangle_array = Array.new(triangle_size)
    for y in 0...triangle_size
      triangle_array[y] = Array.new(triangle_size)
      for x in 0...triangle_size
        triangle_array[y][x] = " "
      end
    end

    # keep debug separate from user's use
    puts triangle_array.inspect if ($debug == true)

    # number one triangle
    if (user_opinion == 1)
      for y in 1..triangle_size
        for x in 1..triangle_size
          # y==x is the angle side # x == 1 is the right side # y == triangle_size is the bottom of the triangle
          if (y == x || x == 1 || y == triangle_size)
            triangle_array[y-1][x-1] = "*"
          end
        end
      end
    # number two triangle
    elsif (user_opinion == 2)
      for y in 1..triangle_size
        for x in 1..y
          triangle_array[y-1][x-1] = "#{x}"
        end
      end
    elsif (user_opinion == 3)
      # slit in to 4 triangle
      # Q1|Q2
      # -----
      # Q3|Q4
      # size
      diamond_size = (triangle_size/2)+(triangle_size%2)
      # Q2
      diamond_q2 = Array.new(diamond_size)
      for y in 1..diamond_size
        diamond_q2[y-1] = Array.new(diamond_size)
        for x in 1..diamond_size
          if (y == x)
            diamond_q2[y-1][x-1] = "*"
          else
            diamond_q2[y-1][x-1] = " "
          end
        end
      end
      # Q1
      diamond_q1 = Array.new(diamond_size)
      for y in 1..diamond_size
        diamond_q1[y-1] = diamond_q2[y-1].reverse
      end
      # Q3
      diamond_q3 = diamond_q1.reverse
      # Q4
      diamond_q4 = diamond_q2.reverse
      # keep debug separate from user's use
      puts diamond_q1.inspect if ($debug == true)
      print_array diamond_q1 if ($debug == true)
      puts diamond_q2.inspect if ($debug == true)
      print_array diamond_q2 if ($debug == true)
      puts diamond_q3.inspect if ($debug == true)
      print_array diamond_q3 if ($debug == true)
      puts diamond_q4.inspect if ($debug == true)
      print_array diamond_q4 if ($debug == true)
      # put to gather
      for y in 1..triangle_size
        for x in 1..triangle_size
          # Q1
          if (y <= diamond_q1.length && x <= diamond_q1.length)
            triangle_array[y-1][x-1] = diamond_q1[y-1][x-1]
          elsif (y <= diamond_q2.length && x <= diamond_q1.length+diamond_q2.length)
            triangle_array[y-1][(x+diamond_q1.length)-(diamond_size+1)] = diamond_q2[y-1][(x-diamond_q2.length)]
          elsif (x <= diamond_q3.length)
            triangle_array[y-1][x-1] = diamond_q3[y-diamond_q1.length][x-1]
          else
            triangle_array[y-1][(x+diamond_q3.length)-(diamond_size+1)] = diamond_q4[y-diamond_q1.length][(x-diamond_q3.length)]
          end
        end
      end
    end

    # flip triangle
    if (triangle_reflect == true)
      # keep debug separate from user's use
      puts triangle_array.inspect if ($debug == true)
      # fliping each line
      for y in 0...triangle_array.length
        triangle_array[y].reverse!
      end
    end

    # keep debug separate from user's use
    puts triangle_array.inspect if ($debug == true)

    # print the screen
    print_array triangle_array

    puts ""
  # turn debug on and off
  elsif (user_opinion == menu.length+2)
    $debug = !$debug
    puts "Debug is On" if ($debug)
    puts "Debug is Off" if (!$debug)
  # check for any other input
  else
    # Check if they pick a opinion not not part of the list of opinion's
    if (user_opinion != menu.length+1)
      puts "incorrect input - exiting program"
    end
    run_program = false
  end
end
# Say good by
if (user_opinion == menu.length+1)
  puts "Have a good day"
end