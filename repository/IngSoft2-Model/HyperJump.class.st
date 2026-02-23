"
HyperJump
"
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
HyperJump class >> inPosition: aPosition withEffect: aListOfParsec [
	| sortedParsecs |
	sortedParsecs :=aListOfParsec asSortedCollection reverse.
	^(self inPosition: aPosition ) initializeWithParsecs:sortedParsecs .
	
]

{ #category : 'effects' }
HyperJump >> applyEffectsTo: aSpaceship in: aGame [
    | parsecsValue tilesToAdvance |
	
    listOfValues isEmpty ifTrue: [ listOfValues := originalList copy ].
    parsecsValue := listOfValues max.
    listOfValues remove: parsecsValue.

    tilesToAdvance := parsecsValue // convertor.
	 aGame saveLastEffect: [:aShip | aShip move:tilesToAdvance ].
    aSpaceship move: tilesToAdvance.
]

{ #category : 'effects' }
HyperJump >> convert: aConvertor with: sizeOfBoard and: aListOfValues [
	| results |
	convertor := aConvertor.
	parsecs := convertor * (sizeOfBoard parsec).
	results := aListOfValues collect: [ :each | each parsec ].
	originalList := results asSortedCollection.
	listOfValues := originalList asSortedCollection.
]

{ #category : 'initialization' }
HyperJump >> initializeWithParsecs:sortedCollection [
	listOfValues :=sortedCollection.
	
]
