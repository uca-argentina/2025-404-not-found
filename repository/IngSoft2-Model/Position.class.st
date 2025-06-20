"
Describes position of the spaceship
"
Class {
	#name : 'Position',
	#superclass : 'Object',
	#instVars : [
		'index',
		'lap'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Position class >> in: anIndex at: aLap [
	^ self new initializeIn: anIndex at: aLap
]

{ #category : 'logic' }
Position >> + aNumber [
	^ self class in: index + aNumber at: lap 
]

{ #category : 'accessing' }
Position >> = aPosition [
	^ (index = aPosition index) & (lap = aPosition lap)
]

{ #category : 'logic' }
Position >> backToZero [
	^ self class in: 0 at: lap 
]

{ #category : 'testing' }
Position >> hasDoneLaps: numberOfLaps [
	^ lap == numberOfLaps 
]

{ #category : 'accessing' }
Position >> index [
	^index
]

{ #category : 'initialization' }
Position >> initializeIn: anIndex at: aLap [
	index := anIndex.
	lap := aLap.
]

{ #category : 'logic' }
Position >> inside: aSize [
	
	index < 0 ifTrue: [ 
		^ self class in: aSize + index at: lap - 1.
	].
	index > aSize ifTrue: [ 
		^ self class in: index \\ aSize - 1 at: lap + 1.
	].
	^ self
]

{ #category : 'accessing' }
Position >> lap [
	^lap
]
