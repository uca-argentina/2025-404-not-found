Class {
	#name : 'NSidedDiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
NSidedDiceTest >> testWhenTheDieIsRolledThenTheResultIsBetween1And6 [

	| sides aDie number |
	sides := 6.
	aDie := Die with: sides.
	number := aDie roll.
	self assert: (number >= 1 and: number <= sides )
]

{ #category : 'tests' }
NSidedDiceTest >> testWhenTheDieIsRolledThenTheResultIsBetween1AndN [

	| sides aDie number |
	sides := 20.
	aDie := Die with: sides.
	number := aDie roll.
	self assert: (number >= 1 and: number <= sides)
]
