"
Board class creates a board with a size, checks for limits and for warm holes.
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'size',
		'entraceHole',
		'exitHole',
		'entranceHole'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit [
	^ self new initializeWith: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit.
]

{ #category : 'check' }
Board >> checkHoleAndRelocate: aSpaceshipPosition [
	^ (aSpaceshipPosition = entranceHole)
	ifTrue: [exitHole]
	ifFalse: [
		(aSpaceshipPosition = exitHole )
		ifTrue:[entranceHole ]
		ifFalse:[aSpaceshipPosition ]
		 ]
	
]

{ #category : 'check' }
Board >> checksLimits: aPosition [ 
	^(aPosition>=1 and: aPosition<=size)
]

{ #category : 'initialization' }
Board >> initializeWith: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit [
	size := sizeOfBoard.
	entranceHole:=anEntrance.
	exitHole:=anExit.
]
