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
Board class >> with: sizeOfBoard [ 
	^ self new initializeWith: sizeOfBoard
]

{ #category : 'instance creation' }
Board class >> with: sizeOfBoard andEntraceHole:anEntrance andExitHole:anExit [
	^ self new initializeWith: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit.
]

{ #category : 'instance creation' }
Board class >> with: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit [
	^ self new initializeWith: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit.
]

{ #category : 'as yet unclassified' }
Board >> checkHole: aSpaceshipPosition [
	^ (aSpaceshipPosition = entranceHole)
	ifTrue: [exitHole]
	ifFalse: [
		(aSpaceshipPosition = exitHole )
		ifTrue:[entranceHole ]
		ifFalse:[aSpaceshipPosition ]
		 ]
	
]

{ #category : 'as yet unclassified' }
Board >> checksLimits: aPosition [ 
	^(aPosition>=1 and: aPosition<=size)
]

{ #category : 'initialization' }
Board >> initializeWith: sizeOfBoard [
	size := sizeOfBoard.
]

{ #category : 'initialization' }
Board >> initializeWith: sizeOfBoard andEntranceHole:anEntrance andExitHole:anExit [
	size := sizeOfBoard.
	entranceHole:=anEntrance.
	exitHole:=anExit.
]
