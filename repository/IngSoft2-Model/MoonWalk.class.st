"
MoonWalk
"
Class {
	#name : 'MoonWalk',
	#superclass : 'BoardTile',
	#instVars : [
		'nTiles'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> inPosition: aPosition backingUp: aNumber [
	^(self inPosition: aPosition ) initializeBackingUp:aNumber 
]

{ #category : 'effects' }
MoonWalk >> applyEffectsTo: aSpaceship in: aGame [
	aGame saveLastEffect: [:aShip | aShip move:nTiles ].
	aGame activateMoonWalk: nTiles from: aSpaceship. "le pasa la cantidad de que tendra que restar cada nave"

]

{ #category : 'initialization' }
MoonWalk >> initializeBackingUp: aNumber [
	nTiles:= aNumber negated .
]
