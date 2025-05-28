Class {
	#name : 'MoonWalk',
	#superclass : 'BoardTile',
	#instVars : [
		'nTiles'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
MoonWalk >> applyEffectsTo: aSpaceship in: aGame [

	aGame activateMoonWalk: nTiles from: aSpaceship. "le pasa la cantidad de que tendra que restar cada nave"

]

{ #category : 'as yet unclassified' }
MoonWalk >> tilesToBack: someTiles [
	nTiles:= someTiles.
]
