"
Similar to die but always returns the number, just for testing purposes
"
Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'number'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'create instance' }
LoadedDie class >> with: aNumber [
	^ self new initialize: aNumber 
]

{ #category : 'initialization' }
LoadedDie >> initialize: aNumber [
	number := aNumber
]

{ #category : 'roll' }
LoadedDie >> roll [
	^ number
]
