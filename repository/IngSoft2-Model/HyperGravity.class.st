"
Hyper gravity
"
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
	aSpaceship lockUntil: exitRoll.
	
]

{ #category : 'accessing' }
HyperGravity >> exitRoll: anExitRoll [
	exitRoll := anExitRoll.
	
]
