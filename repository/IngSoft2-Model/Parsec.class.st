Class {
	#name : 'Parsec',
	#superclass : 'Unit',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Parsec class >> with: aParsecValue [ 
	^self new initializeWith: aParsecValue .
]

{ #category : 'as yet unclassified' }
Parsec >> parsec [
	^value 
]
