"
Spaceship that can move by updating its position
"
Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName [
	^ self new initializeWith: aName
]

{ #category : 'initialization' }
Spaceship >> initializeWith: aName [
	position := 0.
	name := aName.
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	position := position + numberOfBoxes.
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
