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

{ #category : 'initialization' }
FuelTank >> initializeWith: aMaxFuel [
	fuel := aMaxFuel.
	maxFuel := aMaxFuel.
]

{ #category : 'moving' }
FuelTank >> refuel [
	fuel := maxFuel.
]

{ #category : 'moving' }
FuelTank >> useFuel: numberOfTiles from: spaceship [

	fuel := fuel - numberOfTiles abs.
	fuel > 0 ifTrue: [ ^self ].
	spaceship penalize.
	fuel := 0.
]
