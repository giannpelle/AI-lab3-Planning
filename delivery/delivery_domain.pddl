(define (domain delivery-packages)

  (:requirements :strips)

  (:predicates
    (IS-CITY ?x)
    (IS-TRUCK ?x)
    (IS-PACKAGE ?x)
    (ARE-CONNECTED ?c1 ?c2)
    (truck-at ?t ?c)
    (package-at ?p ?l)
  )
  
  (:action move
    :parameters (?truck ?city1 ?city2)
    :precondition (and 
      (IS-TRUCK ?truck)
      (IS-CITY ?city1)
      (IS-CITY ?city2)
      (truck-at ?truck ?city1)
      (or
      (ARE-CONNECTED ?city1 ?city2)
      (ARE-CONNECTED ?city2 ?city1)
      )
    )
  :effect (and 
    (not(truck-at ?truck ?city1))
    (truck-at ?truck ?city2)
  )
)

(:action load
    :parameters (?truck ?package ?city)
    :precondition (and 
      (IS-TRUCK ?truck)
      (IS-PACKAGE ?package)
      (IS-CITY ?city)
      (truck-at ?truck ?city)
      (package-at ?package ?city)
    )
    :effect (and 
      (not(package-at ?package ?city))
      (package-at ?package ?truck)
      )
)

(:action unload
    :parameters (?truck ?package ?city)
    :precondition (and 
      (IS-TRUCK ?truck)
      (IS-PACKAGE ?package)
      (IS-CITY ?city)
      (truck-at ?truck ?city)
      (package-at ?package ?truck)
    )
    :effect (and 
      (not(package-at ?package ?truck))
      (package-at ?package ?city)
      )
)


)