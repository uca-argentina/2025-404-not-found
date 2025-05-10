"
Board class creates a board with a size, checks for limits and for warm holes.
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'wormhole',
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: aBoardSize wormhole: aWormhole [ 
	^ self new with: aBoardSize wormhole: aWormhole.
]

{ #category : 'check' }
Board >> checkHoleAndRelocate: aSpaceshipPosition [

    (wormhole isWormhole: aSpaceshipPosition) ifTrue: [ ^ wormhole newPosition: aSpaceshipPosition ].
    ^ aSpaceshipPosition.

 
	
	
]

{ #category : 'check' }
Board >> checksLimits: aPosition [ 
	^(aPosition>=1 and: aPosition<=size)
]

{ #category : 'initialization' }
Board >> with: aBoardSize wormhole: aWormhole [
	
	
	size := aBoardSize.
	wormhole := aWormhole.
]
