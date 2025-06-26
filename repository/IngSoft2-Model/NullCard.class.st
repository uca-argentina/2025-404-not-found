Class {
	#name : 'NullCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
NullCard class >> with: anAction [
	^ self new initializeWith: anAction.
]

{ #category : 'as yet unclassified' }
NullCard >> actOn: aSpaceship from: aSpaceship2 in: aGame [ 
	^self
]

{ #category : 'initialization' }
NullCard >> initializeWith: anAction [
	action := anAction 
]
