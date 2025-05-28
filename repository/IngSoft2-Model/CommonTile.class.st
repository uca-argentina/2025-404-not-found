Class {
	#name : 'CommonTile',
	#superclass : 'BoardTile',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
CommonTile >> applyEffectsTo: aSpaceship in: aGame [
	aSpaceship newPosition: 0.
]
