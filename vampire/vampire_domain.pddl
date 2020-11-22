(define (domain vampire)
    (:requirements :conditional-effects)
    (:predicates
        (light-on ?r)
        (slayer-is-alive)
        (slayer-is-in ?r)
        (vampire-is-alive)
        (vampire-is-in ?r)
        (fighting)
        ;
        ; static predicates
        (NEXT-ROOM ?r ?rn)
        (CONTAINS-GARLIC ?r)
    )

    (:action toggle-light
        :parameters (?anti-clockwise-neighbor ?room ?clockwise-neighbor)
        :precondition (and
            (NEXT-ROOM ?anti-clockwise-neighbor ?room)
            (NEXT-ROOM ?room ?clockwise-neighbor)
            (not (fighting))
        )
        :effect (and
            (when
                ;Antecedent
                (and
                    (light-on ?room)
                )
                ;Consequence
                (and
                    (not (light-on ?room))
                )
            )
            (when
                ;Antecedent
                (and
                    (not(light-on ?room))
                )
                ;Consequence
                (and
                    (light-on ?room)
                )
            )

; light is turning on => vampire moves
            (when
                ;Antecedent
                (and
                    (vampire-is-alive)
                    (vampire-is-in ?room)
                    (not(light-on ?room))
                    (light-on ?anti-clockwise-neighbor)
                )
                ;Consequence
                (and
                    (not(vampire-is-in ?room))
                    (vampire-is-in ?clockwise-neighbor)
                    (when 
                        ;Antecedent
                        (and
                            (slayer-is-alive)
                            (slayer-is-in ?clockwise-neighbor)
                        )
                        ;Consequence
                        (and
                            (fighting)
                        )
                     )
                )
            )
            (when
                ;Antecedent
                (and
                    (vampire-is-alive)
                    (vampire-is-in ?room)
                    (not(light-on ?room))
                    (not(light-on ?anti-clockwise-neighbor))
                    ; (light-on ?clockwise-neighbor)
                )
                ;Consequence
                (and
                    (not(vampire-is-in ?room))
                    (vampire-is-in ?anti-clockwise-neighbor)
                    (when 
                        ;Antecedent
                        (and
                            (slayer-is-alive)
                            (slayer-is-in ?anti-clockwise-neighbor)
                        )
                        ;Consequence
                        (and
                            (fighting)
                        )
                     )
                )
            )

; light is turning off => slayer moves
            (when
                ;Antecedent
                (and
                    (slayer-is-alive)
                    (slayer-is-in ?room)
                    (light-on ?room)
                    (light-on ?clockwise-neighbor)
                )
                ;Consequence
                (and
                    (not(slayer-is-in ?room))
                    (slayer-is-in ?clockwise-neighbor)
                    (when 
                        ;Antecedent
                        (and
                            (vampire-is-alive)
                            (vampire-is-in ?clockwise-neighbor)
                        )
                        ;Consequence
                        (and
                            (fighting)
                        )
                     )
                )
            )
            (when
                ;Antecedent
                (and
                    (slayer-is-alive)
                    (slayer-is-in ?room)
                    (light-on ?room)
                    (not(light-on ?clockwise-neighbor))
                )
                ;Consequence
                (and
                    (not(slayer-is-in ?room))
                    (slayer-is-in ?anti-clockwise-neighbor)
                    (when 
                        ;Antecedent
                        (and
                            (vampire-is-alive)
                            (vampire-is-in ?anti-clockwise-neighbor)
                        )
                        ;Consequence
                        (and
                            (fighting)
                        )
                     )
                )
            )
        )
    )

    (:action watch-fight
        :parameters (?room)
        :precondition (and
            (slayer-is-in ?room)
            (slayer-is-alive)
            (vampire-is-in ?room)
            (vampire-is-alive)
            (fighting)
        )
        :effect (and
            (when 
                ;Antecedent
                (or
                    (light-on ?room)
                    (CONTAINS-GARLIC ?room)
                )
                ;Consequence
                (and
                    (not(vampire-is-alive))
                    (not(fighting))
                )
             )

            (when 
                ;Antecedent
                (and
                    (not(light-on ?room))
                    (not(CONTAINS-GARLIC ?room))
                )
                ;Consequence
                (and
                    (not(slayer-is-alive))
                    (not(fighting))
                )
             )
        )
    )
)
