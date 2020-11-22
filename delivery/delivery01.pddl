(define (problem deliveroo)
	(:domain delivery-packages)
	(:objects
    	Torino Milano Venezia Napoli Bolzano
		truck1 truck2
		package1 package2 package3
	)

	(:init
		(IS-CITY Torino)
		(IS-CITY Milano)
		(IS-CITY Venezia)
		(IS-CITY Napoli)
		(IS-CITY Bolzano)
		(ARE-CONNECTED Torino Milano)
		(ARE-CONNECTED Milano Venezia)
		(ARE-CONNECTED Milano Napoli)
		(ARE-CONNECTED Milano Bolzano)
		(ARE-CONNECTED Bolzano Napoli)
		(IS-TRUCK truck1)
		(IS-TRUCK truck2)
		(truck-at truck1 Napoli)
		(truck-at truck2 Napoli)
		(IS-PACKAGE package1)
		(IS-PACKAGE package2)
		(IS-PACKAGE package3)
		(package-at package1 Napoli)
		(package-at package2 truck1)
		(package-at package3 Milano)
	)
	(:goal 
		(and 
			(package-at package1 Bolzano)
			(package-at package2 Torino)
			(package-at package3 Venezia)
		)
	)
)