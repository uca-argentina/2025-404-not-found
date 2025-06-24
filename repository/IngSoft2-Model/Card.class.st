Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'action'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Card class >> with: anAction [
	^ self new initializeWith: anAction.
]

{ #category : 'accessing' }
Card >> action [
    ^ action
]

{ #category : 'initialization' }
Card >> initializeWith: anAction [
	action := anAction 
]

{ #category : 'as yet unclassified' }
Card >> useAgainst: aSpaceship from: aCardSpaceship in: aGame [
	action actOn: aSpaceship from: aCardSpaceship in: aGame
]
