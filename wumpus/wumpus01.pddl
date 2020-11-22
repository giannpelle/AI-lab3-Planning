(define (problem hunt-the-wumpus)

    (:domain wumpus)

    (:objects
        square12 square13 square14 square15
        square8 square9 square10 square11
        square4 square5 square6 square7
        square0 square1 square2 square3
        North East South West
        agent arrow wumpus gold
    )

    (:init
        (= (total-cost) 0)
        
        (IS-SQUARE square0)
        (IS-SQUARE square1)
        (IS-SQUARE square2)
        (IS-SQUARE square3)
        (IS-SQUARE square4)
        (IS-SQUARE square5)
        (IS-SQUARE square6)
        (IS-SQUARE square7)
        (IS-SQUARE square8)
        (IS-SQUARE square9)
        (IS-SQUARE square10)
        (IS-SQUARE square11)
        (IS-SQUARE square12)
        (IS-SQUARE square13)
        (IS-SQUARE square14)
        (IS-SQUARE square15)

        (IS-ORIENTATION North)
        (IS-ORIENTATION East)
        (IS-ORIENTATION South)
        (IS-ORIENTATION West)

        (IS-AGENT agent)
        (IS-ARROW arrow)
        (IS-WUMPUS wumpus)
        (IS-GOLD gold)

        (adjacent square0 square1 East)
        (adjacent square1 square2 East)
        (adjacent square2 square3 East)
        (adjacent square5 square6 East)
        (adjacent square6 square7 East)
        (adjacent square12 square13 East)
        (adjacent square13 square14 East)
        (adjacent square14 square15 East)
        
        (adjacent square1 square5 North)
        (adjacent square2 square6 North)
        (adjacent square3 square7 North)
        (adjacent square7 square11 North)
        (adjacent square8 square12 North)
        (adjacent square11 square15 North)

        (adjacent square5 square1 South)
        (adjacent square6 square2 South)
        (adjacent square7 square3 South)
        (adjacent square11 square7 South)
        (adjacent square12 square8 South)
        (adjacent square15 square11 South)

        (adjacent square1 square0 West)
        (adjacent square2 square1 West)
        (adjacent square3 square2 West)
        (adjacent square6 square5 West)
        (adjacent square7 square6 West)
        (adjacent square13 square12 West)
        (adjacent square14 square13 West)
        (adjacent square15 square14 West)

        (orientation-clockwise North East)
        (orientation-clockwise East South)
        (orientation-clockwise South West)
        (orientation-clockwise West North)

        (at agent square0)
        (has agent arrow)
        (has-orientation agent North)

        (at wumpus square2)
        (at gold square3)

    )

  ;; goal state
    (:goal
        (and
            (at agent square0)
            (has agent gold)
        )
    )
    (:metric minimize (total-cost))
  )
