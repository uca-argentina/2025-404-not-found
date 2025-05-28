Class {
	#name : 'HyperJump',
	#superclass : 'BoardTile',
	#instVars : [
		'parsecs',
		'listOfValues',
		'originalList',
		'convertor'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectsTo: aSpaceship in: aGame [
	| parsecsValue tilesToAdvance |
	listOfValues isEmpty ifTrue: [ listOfValues := originalList copy ].
	
	parsecsValue := listOfValues first.
	listOfValues := listOfValues allButFirst.
	
	tilesToAdvance := parsecsValue // convertor.
	aSpaceship move: tilesToAdvance.
]

{ #category : 'as yet unclassified' }
HyperJump >> convert: aConvertor with: sizeOfBoard and: aListOfValues [
	convertor := aConvertor.
	parsecs := convertor * sizeOfBoard.
	originalList := aListOfValues copy.
	listOfValues := originalList copy.
]

{ #category : 'initialization' }
HyperJump >> initialize [
	super initialize.
	originalList := #(). "Copia original para resetear"
	listOfValues := #().
	convertor := 1.
]
