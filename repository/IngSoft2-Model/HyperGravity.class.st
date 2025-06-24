Class {
	#name : 'HyperGravity',
	#superclass : 'BoardTile',
	#instVars : [
		'exitRoll'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
HyperGravity >> applyEffectsTo: aSpaceship in: aGame [
	aGame saveLastEffect: [:aShip | aShip lockUntil:exitRoll ].
	aSpaceship lockUntil: exitRoll.
	
]

{ #category : 'accessing' }
HyperGravity >> exitRoll: anExitRoll [
	exitRoll := anExitRoll.
	
]
