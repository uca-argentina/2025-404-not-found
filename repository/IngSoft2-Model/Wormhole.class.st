"
wormhole
"
Class {
	#name : 'WormHole',
	#superclass : 'BoardTile',
	#instVars : [
		'effect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
WormHole >> applyEffectsTo: aSpaceship in: aGame [
	aSpaceship newPosition: effects .


	"effects ifNotNil: [effects do: [ :effect | effect applyTo: aSpaceship ] ]."
]

{ #category : 'effects' }
WormHole >> inPosition: aPosition withEffect:anEffect [
	position :=aPosition.
	effects :=anEffect.
]

{ #category : 'effects' }
WormHole >> position: aPosition effect:anEffect [
	position:=aPosition.
	effect :=anEffect .
	
	
]
