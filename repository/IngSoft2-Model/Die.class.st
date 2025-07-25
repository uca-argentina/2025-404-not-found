"
Die class generates a random number between 1 and the number of faces
"
Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'numberSides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Die class >> with: sides [ 
	sides negative ifTrue: [ Error signal: 'Sides should be positive' ].
	^ self new initializeWith: sides
]

{ #category : 'initialization' }
Die >> initializeWith: sides [ 
	numberSides := sides.
]

{ #category : 'accessing' }
Die >> numberSides [
	^numberSides 
]

{ #category : 'roll' }
Die >> roll [
	"Answer a random integer in the interval [1, anInteger]. De la biblioteca random"
	^ (Random new) nextInteger: numberSides
]
