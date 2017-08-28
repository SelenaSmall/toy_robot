# Toy Robot
Toy robot simulator written in Ruby

***

## Installation
Environment: Built on Mac OSx using Ruby -v 2.4.1

Make sure you have the correct version of ruby installed 
https://www.ruby-lang.org/en/documentation/installation/
	
Clone this Repo 
> $ git clone https://github.com/selenasmall/toy_robot.git 

In root of the app run bundle install
> $ gem install bundler && bundle install

***

## Usage
Run the program from the app root
> $ toy_robot.rb

Expected terminal output:
> Options: PLACE X,Y,F; MOVE; LEFT; RIGHT; REPORT; EXIT

Commands | Description
--- | ---
PLACE X,Y,F | Place the robot on the table at coordinates x,y and facing the direction f. Valid x andy values are between 0-4. Valid directions are WEST, NORTH, EAST, SOUTH. Example Input: "PLACE 0,0,NORTH"
MOVE | Move the robot forward 1 step in the direction it is facing.
LEFT | Turn the robot's direction 90 degress to the left. I.e. if the robot is facing NORTH, 1 left turn will turn the robot's direction to WEST.
RIGHT | Turn the robot's direction 90 degress to the right. I.e. if the robot is facing NORTH, 1 left turn will turn the robot's direction to EAST.
REPORT | Output the current position of the robot. Example Output: "Output: 0,0,NORTH"
EXIT | Gracefully exit the program.

***

## Testing
Test by running rspec http://rspec.info/ 
> $ bundle exec rspec
	
Expected terminal output:
> ... ... ... ... ... ... ... ..Output: 1,2,NORTH
>
> ... ... ... ... ... ... ..
>
> Finished in 0.02025 seconds (files took 0.2322 seconds to load)
>
> 43 examples, 0 failures

***

## Specifications
### Description

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

There are no other obstructions on the table surface.

The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
 
Create an application that can read in commands of the following form - PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT

__PLACE__ 

* Will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

* The origin (0,0) can be considered to be the SOUTH WEST most corner.

* The first valid command to the robot is a PLACE command, aXer that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

__MOVE__ 

* Will move the toy robot one unit forward in the direction it is currently facing.

__LEFT and RIGHT__ 

* Will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

__REPORT__ 

* Will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
 
* A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.

* Input can be from a file, or from standard input, as the developer chooses. . Provide test data to exercise the application.
 
### Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
 
Example Input and Output:
a)
> PLACE 0,0,NORTH
>
> MOVE
>
> REPORT
>
> Output: 0,1,NORTH
 
b)
> PLACE 0,0,NORTH
>
> LEFT
>
> REPORT
>
> Output: 0,0,WEST
 
c)
> PLACE 1,2,EAST
>
> MOVE
>
> MOVE
>
> LEFT
>
> MOVE
>
> REPORT
>
> Output: 3,3,NORTH
 
### Deliverables

The source files, the test data and any test code.
It is not required to provide any graphical output showing the movement of the toy robot.
