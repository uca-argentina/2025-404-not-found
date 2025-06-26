Class {
	#name : 'BoardTile',
	#superclass : 'Object',
	#instVars : [
		'position',
		'effects'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardTile class >> inPosition: aPosition [ 
	aPosition negative ifTrue: [
		Error signal: 'Tile should be a positive position' ].
	^self new inPosition: aPosition 
]

{ #category : 'as yet unclassified' }
BoardTile class >> inPosition: aPosition withEffect: anEffect [
	aPosition negative ifTrue: [
		Error signal: 'Tile should be a positive position' ].
	^self new inPosition: aPosition withEffect: anEffect 
]

{ #category : 'effects' }
BoardTile >> applyEffectsTo: aSpaceship in: aGame [
    self subclassResponsibility.
]

{ #category : 'accessing' }
BoardTile >> inPosition: aPosition [
	position:=aPosition.

]

{ #category : 'effects' }
BoardTile >> inPosition: aPosition withEffect:anEffect [
	effects :=anEffect.
	position:=aPosition.

]

{ #category : 'accessing' }
BoardTile >> position [
	^position 
]
