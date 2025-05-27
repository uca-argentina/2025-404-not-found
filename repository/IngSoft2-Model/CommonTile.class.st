"
common tile
"
Class {
	#name : 'CommonTile',
	#superclass : 'BoardTile',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
CommonTile >> applyEffectsTo: aSpaceship [
	aSpaceship newPosition: 0.
]
