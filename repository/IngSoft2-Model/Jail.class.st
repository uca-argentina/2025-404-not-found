Class {
	#name : 'Jail',
	#superclass : 'BoardTile',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
Jail >> applyEffectsTo: aSpaceship in: aGame [
	aSpaceship goToJailIn: position .
	
	
]
