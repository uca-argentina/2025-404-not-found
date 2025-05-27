"
Board tile
"
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

{ #category : 'effects' }
BoardTile >> applyEffectsTo: aSpaceship [
    self subclassResponsibility.
	"effects ifNotNil: [effects do: [ :effect | effect applyTo: aSpaceship ] ]."
]

{ #category : 'accessing' }
BoardTile >> position [
	^position 
]

{ #category : 'accessing' }
BoardTile >> position: aNumber [
	position:= aNumber
]
