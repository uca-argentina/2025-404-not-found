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

{ #category : 'effects' }
HyperJump >> applyEffectsTo: aSpaceship in: aGame [
    | parsecsValue tilesToAdvance |

    listOfValues isEmpty ifTrue: [ listOfValues := originalList copy ].
    parsecsValue := listOfValues max.
    listOfValues remove: parsecsValue.

    tilesToAdvance := parsecsValue // convertor.
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
HyperJump >> initialize [
	super initialize.
	originalList := #(). "Copia original para resetear"
	listOfValues := #().
	convertor := 1.
]
