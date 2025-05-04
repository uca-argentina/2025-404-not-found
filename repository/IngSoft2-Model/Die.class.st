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
	^ self new initializeWith: sides
]

{ #category : 'initialization' }
Die >> initializeWith: sides [ 
	numberSides := sides.
]

{ #category : 'roll' }
Die >> roll [
	"Answer a random integer in the interval [1, anInteger]. De la biblioteca random"
	^ (Random new) nextInteger: numberSides

]
