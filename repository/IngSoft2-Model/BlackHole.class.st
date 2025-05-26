Class {
	#name : 'BlackHole',
	#superclass : 'BoardTileEffect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BlackHole class >> with: position [
	self new initializeWith: position
]

{ #category : 'operations' }
BlackHole >> applyTo: aSpaceship [ 
	aSpaceship moveBackwards: 4.
]
