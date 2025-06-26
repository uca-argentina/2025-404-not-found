"
Similar to die but always returns the number, just for testing purposes
"
Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'index',
		'numbers',
		'numbersSize'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'create instance' }
LoadedDie class >> with: aNumber [
	^ self new initialize: aNumber 
]

{ #category : 'initialization' }
LoadedDie >> initialize: anArrayNumbers [
	numbers := anArrayNumbers.
	numbersSize := anArrayNumbers size.
	index := 1.
]

{ #category : 'accessing' }
LoadedDie >> numberSides [
	^6.
]

{ #category : 'roll' }
LoadedDie >> roll [
	| result |
	result := numbers at: index.
	index := (index \\ numbersSize) + 1.
	^result.
	
]
