Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: sizeOfBoard [ 
	^ self new initializeWith: sizeOfBoard
]

{ #category : 'as yet unclassified' }
Board >> checksLimits: aPosition [ 
	^(aPosition>=1 and: aPosition<=size)
]

{ #category : 'initialization' }
Board >> initializeWith: sizeOfBoard [
	size := sizeOfBoard.
]
