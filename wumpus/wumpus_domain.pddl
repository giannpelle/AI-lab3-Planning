(define (domain wumpus)
    (:requirements :strips :typing :action-costs :conditional-effects :equality)

    (:predicates
        (IS-SQUARE ?x)
        (IS-ORIENTATION ?x)
        (IS-AGENT ?x)
        (IS-ARROW ?x)
        (IS-WUMPUS ?x)
        (IS-GOLD ?s)
        (adjacent ?x ?y ?o)
        (orientation-clockwise ?x ?y)
        (has-orientation ?x ?o)
        (at ?x ?s)
        (has ?x ?y)
    )

    (:functions
        (total-cost)
    )

    (:action rotate-clockwise
        :parameters (?agent ?from-orientation ?to-orientation)
        :precondition (and 
            (IS-AGENT ?agent)
            (IS-ORIENTATION ?from-orientation)
            (IS-ORIENTATION ?to-orientation)
            (has-orientation ?agent ?from-orientation)
            (orientation-clockwise ?from-orientation ?to-orientation)
        )
        :effect (and 
            (not(has-orientation ?agent ?from-orientation))
            (has-orientation ?agent ?to-orientation)
            (increase (total-cost) 1)
        )
    )
    
    (:action rotate-anti-clockwise
        :parameters (?agent ?from-orientation ?to-orientation)
        :precondition (and 
            (IS-AGENT ?agent)
            (IS-ORIENTATION ?from-orientation)
            (IS-ORIENTATION ?to-orientation)
            (has-orientation ?agent ?from-orientation)
            (orientation-clockwise ?to-orientation ?from-orientation)
        )
        :effect (and 
            (not(has-orientation ?agent ?from-orientation))
            (has-orientation ?agent ?to-orientation)
            (increase (total-cost) 1)
        )
    )

    (:action move
        :parameters (?agent ?orientation ?from-square ?to-square ?wumpus)
        :precondition (and 
            (IS-AGENT ?agent)
            (IS-ORIENTATION ?orientation)
            (IS-SQUARE ?from-square)
            (IS-SQUARE  ?to-square)
            (IS-WUMPUS ?wumpus)
            (at ?agent ?from-square)
            (has-orientation ?agent ?orientation)
            (adjacent ?from-square ?to-square ?orientation)
            (not(at ?wumpus ?to-square))
        )
        :effect (and 
            (not(at ?agent ?from-square))
            (at ?agent ?to-square)
            (increase (total-cost) 1)
        )
    )

    (:action shoot
        :parameters (?agent ?orientation ?arrow ?from-square ?to-square ?wumpus)
        :precondition (and
            (IS-AGENT ?agent)
            (IS-ORIENTATION ?orientation)
            (IS-ARROW ?arrow)
            (IS-SQUARE ?from-square)
            (IS-SQUARE  ?to-square)
            (IS-WUMPUS ?wumpus)
            (at ?agent ?from-square)
            (has-orientation ?agent ?orientation)
            (has ?agent ?arrow)
            (adjacent ?from-square ?to-square ?orientation)
            (at ?wumpus ?to-square)
             )
        :effect (and
            (not(at ?wumpus ?to-square))
            (not(has ?agent ?arrow))
            (increase (total-cost) 10)
         )
    )

    (:action grab
        :parameters (?agent ?square ?gold)
        :precondition (and 
            (IS-AGENT ?agent)
            (IS-SQUARE ?square)
            (IS-GOLD ?gold)
            (at ?agent ?square)
            (at ?gold ?square)
            )
        :effect (and 
            (not(at ?gold ?square))
            (has ?agent ?gold)
            (increase (total-cost) 1)
        )
    )
    
    


)