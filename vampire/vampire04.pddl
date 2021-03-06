(define (problem p04)
(:domain vampire)
;
; Room1 Room2 Room3 Room4 Room5
; 0V    0G    0S    0     0
;
(:objects
    room1
    room2
    room3
    room4
    room5
)
(:init
    (slayer-is-alive)
    (slayer-is-in room3)

    (vampire-is-alive)
    (vampire-is-in room1)

    (CONTAINS-GARLIC room2)

    (NEXT-ROOM room1 room2)
    (NEXT-ROOM room2 room3)
    (NEXT-ROOM room3 room4)
    (NEXT-ROOM room4 room5)
    (NEXT-ROOM room5 room1)
)
(:goal (and
    (slayer-is-alive)
    (not (vampire-is-alive))
    (slayer-is-in room2)
))
)
