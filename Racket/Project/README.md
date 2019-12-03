# Conway's Game of Life in Racket using Threads
Monterrey Insitute of Technology and Superior Studies
Santa Fe Campus 

Programming Languages Final Project

Christian Aguilar 
Alejandro Gutierrez

02/12/2019

The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970

## Rules
In each iteration the following rules are applied to every cell on the grid:

Any live cell with fewer than two live neighbours dies, as if by underpopulation.
Any live cell with two or three live neighbours lives on to the next generation.
Any live cell with more than three live neighbours dies, as if by overpopulation.
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

These rules, which compare the behaviour of the automaton to real life, can be condensed into the following:

Any live cell with two or three neighbours survives.
Any dead cell with three live neighbours becomes a live cell.
All other live cells die in the next generation. Similarly, all other dead cells stay dead.

 ## Getting Started

 This project runs completely on the Dr Racket IDE for Racket programming language with the help of 3 libraries.

 ### Prerequisites

Racket
DrRacket
Source code

### Running the code

Once inside the IDE, load the file with the source code and run it, 
then use 
```
(main) 
```
to execute the program

The program will run the main function containing one of the 4 patterns, new patterns can be defined on the bottom of the program.

* stopLight
* stopLight2
* pulsar  
* lighting

The main function looks like this:
```
(define (main)
  (game-of-life (pulsar) 28)
)
```
The function game-of-life calls the full program to run in an animated separate window asking for two parameters, the first one is a list with two numbers and a list of lists with two pairs of numbers noting the x and y coordinates of live cells (top left corner is 0 0) and the second one is the number of ticks to wait until the next screen is displayed (28 ticks in one second).

## Code Explanation

### Imported Libraries
lang racket
(require 2htdp/image 2htdp/universe)
(require racket/async-channel)

### Functions
* Create Empty Grid object with m as the height and n as the width
```
(define (make-empty-grid m n) 
```

* Get height of the grid - Returns the height of the grid, which is equivalent to the number of rows.
```
(define rows vector-length)
```

* Get width of the grid - Returns the width of the grid, which is equivalent to the number of columns.
```
(define (cols grid)
```

* Grid with living cells - Makes a new grid and places the living cells with the coordinates specified in the living-cells list.
```
(define (make-grid m n living-cells)
```

* Get cell - Returns the value of the cell, can be a 1 or 0 in this case. Equivalent to C++ vec[i][j], due to the fact that it's saved on the double vector.
```
(define (2d-ref grid i j)
```

* Gets cells- Returns the value of the cells defined by the indices provided for the declared grid. It basically runs the previous function for all the indexes provided. 
```
(define (2d-refs grid indices)
```

* Set a cell- Set a cell in the grid to a particular value. Equivalent to C++ vec[i][j]= val.
```
(define (2d-set! grid i j val)
```

* Cartesian product of 2 lists and returns all the indexes resulting on that product
```
(define (cart l1 l2)
```

* Count living cells in the neighbourhood using the cartesian product of +i, i, -i and +j, j, -j to obtain the indexes of where in the grid must be checked. After doing this it subtracts the value in ij
```
(define (count-neighbours grid i j)
```

* The number of neighbours is used as an index and the value of the cell is used to access one of the two lists.
```
(define conway-rules 
```

* Next state Cell- The next state of the cell is calculated using conway-rules and the count of the neighbours.
```
(define (next-state-cell grid i j)
```

* Channel Declaration - Channels are declared asynchronous so that the main channel can receive the answers back. The buffer is declared of size 1000, so the channel can contain up to 1000 messages at the same time.
```
(define work-channel (make-async-channel 1000))
(define result-channel (make-async-channel 1000))
```

* Worker thread -  Gets the row and calculates next iteration of row. It gets the row from the work-channel, then it places the resulting row (vector)  in the result channel. It knows that it finished due to a flag “end” being places 4 times in the work-channel by the main thread, as there were 4 threads being declared in the “next-gridT” function.
```
(define (make-worker thread-id)
```

* Next grid threads - The most important and complex function of them all!! This function receives the old grid and returns the newly calculated grid. First, it declares a new grid with the same dimensions as the old one. Then it starts 4 threads and a loop, in this loop, it places in the work-channel a message composed of the width of the grid, the grid and the current number of the row. Then when it's finished sending the rows it sends 4 “end“ messages so the threads know where to finish. After that, the main thread waits for the threads to finish. Moreover, it places another “end” message but now in the result queue for itself. Additionally, it loops through the result-channel and with the vectors which represent rows it builds the new grid. Lastly, it sends the newly constructed grid back.
```
(define (next-gridT grid)
```

* Next Grid Iterative - Calls the function next-state-cell for each cell and calculates if it's alive or dead.
```
(define (next-grid grid)
```

* Copy a new grid to old - Basically copies the newly done grid to the old one, so the image being displayed is not always the same.
```
(define (next-grid! grid)
```

* Display image - Draws a white rectangle for a background, then it iterates the grid and plots black squares in the specified coordinates.
```
(define (grid->image grid)
```

* Main Orchestrator - Calls function “animate” which displays an image or drawing and it updates 28 times a second, so it can be said that the simulation runs at 28 ticks.
```
(define (game-of-life grid refresh_time)
```

## Iterative or Threads
To change the mode of the program from threads to iterative or vice versa, you need to change the function call in line 159, “next-gridT” for threads and “next-grid” for iterative.