"
Spaceship fuel tank
"
Class {
	#name : 'FuelTank',
	#superclass : 'Object',
	#instVars : [
		'fuel',
		'maxFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
FuelTank class >> with: maxFuel [
	^ self new initializeWith: maxFuel
]

{ #category : 'accessing' }
FuelTank >> fuel [
	^fuel
]

{ #category : 'as yet unclassified' }
FuelTank >> increaseSize:aNumber [
	maxFuel := maxFuel +aNumber.

]

{ #category : 'initialization' }
FuelTank >> initializeWith: aMaxFuel [
	fuel := aMaxFuel.
	maxFuel := aMaxFuel.
]

{ #category : 'accessing' }
FuelTank >> maxFuel [ 
^maxFuel

]

{ #category : 'moving' }
FuelTank >> refuel [
	fuel := maxFuel.
]

{ #category : 'as yet unclassified' }
FuelTank >> shareFuel: fuelNeeded from: aSpaceship [
	fuel := fuel - fuelNeeded abs.
	fuel > 0 ifTrue: [ ^true ].
	aSpaceship penalize.
	fuel := 0.
	^false.
]

{ #category : 'moving' }
FuelTank >> useFuel: numberOfTiles from: spaceship [

	fuel := fuel - numberOfTiles abs.
	fuel > 0 ifTrue: [ ^self ].
	(spaceship askForFuel: fuel abs) ifTrue: [ ^self ].
	spaceship penalize.
	fuel := 0.
]
