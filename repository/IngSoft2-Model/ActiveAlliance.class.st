Class {
	#name : 'ActiveAlliance',
	#superclass : 'Alliance',
	#instVars : [
		'ally'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
ActiveAlliance class >> with:aSpaceship [
	^self new initializeWith:aSpaceship .
]

{ #category : 'initialization' }
ActiveAlliance >> initializeWith:aSpaceship [
	ally:=aSpaceship .
]

{ #category : 'as yet unclassified' }
ActiveAlliance >> shareFuel: fuelNeeded [ 
	^ ally fuelTank shareFuel: fuelNeeded from: ally
]
