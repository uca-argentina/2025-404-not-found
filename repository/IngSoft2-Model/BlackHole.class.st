Class {
	#name : 'BlackHole',
	#superclass : 'BoardTile',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
BlackHole >> applyEffectsTo: aSpaceship in: aGame [
	aSpaceship move: -4.
]
