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

{ #category : 'adding' }
BoardTile >> addEffect: anEffect [
	effects ifNil:[effects := OrderedCollection new].
	effects add: anEffect.
]

{ #category : 'as yet unclassified' }
BoardTile >> applyEffectsTo: aSpaceship [
    effects ifNotNil: [
        effects do: [ :effect | effect applyTo: aSpaceship ] ].
]

{ #category : 'accessing' }
BoardTile >> position [
	^position 
]

{ #category : 'accessing' }
BoardTile >> position: aNumber [
	position:= aNumber
]
