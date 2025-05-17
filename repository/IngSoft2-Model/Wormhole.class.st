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
Wormhole >> isEntrance: aPosition [
	^ aPosition = entranceBox
]

{ #category : 'testing' }
Wormhole >> isExit: aPosition [
	^ aPosition = exitBox 
]

{ #category : 'position' }
Wormhole >> newPosition: aSpaceshipPosition [
	(self isEntrance: aSpaceshipPosition) ifTrue: [ ^ exitBox ].
	(self isExit: aSpaceshipPosition ) ifTrue: [ ^ entranceBox ].
	^aSpaceshipPosition
	
]
