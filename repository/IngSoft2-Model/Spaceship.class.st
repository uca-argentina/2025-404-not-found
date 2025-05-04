"
Spaceship that can move by updating its position
"
Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Spaceship >> initialize [ 
	position := 0
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	position := position + numberOfBoxes.
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
