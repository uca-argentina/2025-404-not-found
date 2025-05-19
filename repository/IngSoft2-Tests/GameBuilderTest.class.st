Class {
	#name : 'GameBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
GameBuilderTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithInvalidLapsThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: 'Nave 1'.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: 3.
	builder addDieWithValue: 5.
	builder setBoardSize: 10.
	builder setWormholeEntrance: 2 exit: 7.		
	builder setGameLaps: 0.
				
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Number of laps should be greater than 0'	
		
	

]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithInvalidSpaceshipNameThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: ''.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: 3.
	builder addDieWithValue: 5.
	builder setBoardSize: 10.
	builder setWormholeEntrance: 2 exit: 7.		
				
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Name should have at least one character'	
		
	

]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithInvalidWormholeEntranceThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: 'Nave 1'.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: 3.
	builder addDieWithValue: 5.
	builder setBoardSize: 10.
	builder setWormholeEntrance: -2 exit: 7.
	
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Entrance box should be inside the board'			
				
			
		
	

]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithInvalidWormholeExitThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: 'Nave 1'.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: 3.
	builder addDieWithValue: 5.
	builder setBoardSize: 10.
	builder setWormholeEntrance: 2 exit: -7.
	
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Exit box should be inside the board'		
				
			
		
	

]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithNegativeBoardSizeThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: 'Nave 1'.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: 3.
	builder addDieWithValue: 5.
	builder setBoardSize: -10.
	builder setWormholeEntrance: 2 exit: 7.
	
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Board size should be positive'			
				
			
		
	

]

{ #category : 'asserting' }
GameBuilderTest >> testWhenGameCreationWithNegativeDieSideThenFails [
	| builder game |
	builder := GameBuilder new.
	builder addSpaceshipNamed: 'Nave 1'.
	builder addSpaceshipNamed: 'Nave 2'.
	builder addDieWithValue: -3.
	builder addDieWithValue: 5.
	builder setBoardSize: 10.
	builder setWormholeEntrance: 2 exit: 7.
	
	self
		should: [ game := builder buildGame ]
		raise: Error
		withMessageText: 'Sides should be positive'			
				
			
		
	

]
