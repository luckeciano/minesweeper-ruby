# minesweeper-ruby
A simple implementation of minesweeper in Ruby

[![Build Status](https://travis-ci.org/luckeciano/minesweeper-ruby.svg?branch=master)](https://travis-ci.org/luckeciano/minesweeper-ruby)
[![codecov](https://codecov.io/gh/luckeciano/minesweeper-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/luckeciano/minesweeper-ruby)

# Description
This code implements a minesweeper in Ruby in a flexible way for platforms. It's designed in a way that you can put this code inside a platform with several games and change all the details of the view. The user has just few methods for playing the minesweeper in a builder object. However, all parts of the game (data representation, view of the game, behavior of the game) can be replaced without much effort.

# Design

The architecture of the project can be viewd below:


It's based in a Factory of Builders. The Minesweeper is implemented in MVC.

# Game Factory
It's a game object creator pattern. Actually, is a factory of builders: you can create any game using this object, only passing a dictionary of parameters and the name of the game. Useful when it's necessary build lots of games inside a platform, just passing a param_list.

# Game Builder
The game builder holds all objects that composes the game. In this case, the game builder builds MVC-designed games - but it's possible to create another Game Builder inherited from Game who implements another types of architectures for games. The Game Factory can generate all of them.

#  Model, View, Controller

The Minesweeper was implemented in MVC. The model is the data holder and keeps all bombs, flags, the board, etc. The controller implements the behavior of the game: in this case, the "play", the auxiliar algorithms (floodfill, for example). The view is the way the game is represented for the user.
So, in this case, we can change the representation of the game, the way the user see the game or even the behavior of the game in isolated way. Also, we can reuse all of this parts for write new games following the same pattern.
OBS: We use interfaces for implement the MVC. In this project where we have just one game, this interfaces seems to be unuseful. However, if you have lots of games with the same architecture, we can delimit some "pattern methods" and puts them inside the interface.

# Unit Tests
In this project, there are several automated unit tests for almost all classes inside the project. There is a Continuous Building tool for garantee that the tests are not broken. Furthermore, a Code Coverage tool to make sure we are covering all behaviors of the game in tests.

# Component Tests
Some tests in a higher level for teste bigger component or algorithms. Is manual tests, with print statements, good for check some high-level behaviors.

# End-to-end test
Just one integration test to make sure all is working well.

Have fun! If you want to play minesweeper, use the code in "play_game.rb" and play in terminal.
Any questions, mail to luckeciano@gmail.com
