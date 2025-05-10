"
wormhole class has an entrance and an exit, wich is used to relocate the spaceship if it falls into it.
"
Class {
	#name : 'Wormhole',
	#superclass : 'Object',
	#instVars : [
		'entranceBox',
		'exitBox'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Wormhole class >> entrance: anEntranceBox exit: anExitBox [
	^ self new initializeWith: anEntranceBox and: anExitBox.
]

{ #category : 'initialization' }
Wormhole >> initializeWith: anEntranceBox and: anExitBox [ 
	
	entranceBox := anEntranceBox.
	exitBox := anExitBox.
]

{ #category : 'position' }
Wormhole >> isWormhole: aPosition [

	^ (aPosition = entranceBox ) or: (aPosition = exitBox )
]

{ #category : 'position' }
Wormhole >> newPosition: aSpaceshipPosition [ 
	(aSpaceshipPosition = entranceBox ) ifTrue: [ ^ exitBox ].
	^ entranceBox
]
