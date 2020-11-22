# AIMA 2020 Assignment 3 - Planning

This repository contains the group work submitted for the Assignment 2 of the [AIMA 2020](https://ole.unibz.it/course/view.php?id=6841) course from the Free University of Bozen-Bolzano.

## Problem description

This assignment consists in a series of Planning exercise to be solved using PDDL.

The most significant exercise is the **vampire** one:

We are inside a special environment where there is a vampire and a vampire slayer.
The goal of the exercise is to calculate a sequence of actions to make the **slayer kill the vampire** and eventually reach a certain room.

The world consists of a set of rooms adjacent to one another, and each room can either be _dark_ (light off) or _bright_ (light on).
Only one action is possible, which is the _toggle_ action, and all it does is it turn on or off a specific room.
If the room where the vampire currently in becomes _bright_, it will move away from it trying to go a _dark_ room if possible; same for the slayer, if the room he is currently at becomes _dark_, it will try to to go to a _bright_ room.
When the slayer and the vampire meet together inside the same room a **fight triggers**: if the room is _bright_ or if there is a **garlic** inside the room then the slayer kills the vampire, otherwise the vampire kills the slayer.

An example of the **game** is shown below:

<img src="/images/vampire.gif"  width="300">

## Solution outputs

If you want to see the results (outputs) we got from running the different planning exercises below there is the full list of outputs:

* Delivery:
  * [Delivery](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/delivery-output.html)

* Puzzle:
  * [Puzzle](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/puzzle-output.html)
  * [Puzzle weight](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/puzzle-weight-output.html)
  * [Puzzle glued](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/puzzle-glued-output.html)
  * [Puzzle cheat](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/puzzle-cheat-output.html)

* Vampire:
  * [Vampire - 01](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world1-output.html)
  * [Vampire - 02](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world2-output.html)
  * [Vampire - 03](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world3-output.html)
  * [Vampire - 04](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world4-output.html)
  * [Vampire - 05](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world5-output.html)
  * [Vampire - 06](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world6-output.html)
  * [Vampire - 07](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world7-output.html)
  * [Vampire - 08](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world8-output.html)
  * [Vampire - 09](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world9-output.html)
  * [Vampire - 10](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/vampire-world10-output.html)

* Wumpus:
  * [Wumpus](http://htmlpreview.github.io/?https://github.com/giannpelle/AI-lab3-Planning/blob/master/sample-outputs/wumpus-output.html)

## Running requirements

To run the code you have to create an *anaconda* environment with the configuration file found in *environment.yml* and then activate it to run the code.  
The required commands to make it work are the following:
1. `conda create env -f environment.yml`
2. `conda activate aima_plan`
3. `jupyter lab`

To run the sample code you just need to run the code cells in the files *.ipynb* and *h.ipynb*.
