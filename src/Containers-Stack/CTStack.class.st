"
I implement a simple Stack. 

- #push: adds a new object of any kind on top of the stack. 
- #pop returns the first element and remove it from the stack. 
- #top answer the first element of the stack without removing it.
"
Class {
	#name : 'CTStack',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'topIndex',
		'capacity'
	],
	#category : 'Containers-Stack',
	#package : 'Containers-Stack'
}

{ #category : 'instance creation' }
CTStack class >> new [

	"Create a new stack with default capacity of 10"
	
	^ self new: 10
]

{ #category : 'instance creation' }
CTStack class >> new: anInteger [

	anInteger < 1 ifTrue: [ self error: 'Capacity must be positive' ].
	^ self basicNew
		initializeWithCapacity: anInteger;
		yourself
]

{ #category : 'converting' }
CTStack >> asArray [

	| result |
	self isEmpty ifTrue: [ ^ #() ].
	
	result := Array new: self size.
	1 to: self size do: [ :i |
		result at: i put: (elements at: topIndex - i + 1)
	].
	^ result
]

{ #category : 'converting' }
CTStack >> asOrderedCollection [

	| result |
	result := OrderedCollection new: self size.
	self do: [ :each | result add: each ].
	^ result
]

{ #category : 'accessing' }
CTStack >> availableSpace [

	^ capacity - self size
]

{ #category : 'accessing' }
CTStack >> capacity [

	^ capacity 
]

{ #category : 'copying' }
CTStack >> copy [

	
	| copy |
	copy := self class new: capacity.
	self isEmpty ifTrue: [ ^ copy ].
	
	1 to: topIndex do: [ :i |
		copy push: (elements at: i)
	].
	^ copy
]

{ #category : 'enumerating' }
CTStack >> do: aBlock [ 

	self isEmpty ifTrue: [ ^ self ].
	
	topIndex to: 1 by: -1 do: [ :i |
		aBlock value: (elements at: i)
	]
]

{ #category : 'initialization' }
CTStack >> initializeWithCapacity: anInteger [

	capacity := anInteger.
	elements := Array new: capacity.
	topIndex := 0
]

{ #category : 'testing' }
CTStack >> isEmpty [

	"Return true if stack has no elements"
	
	^ topIndex = 0
]

{ #category : 'testing' }
CTStack >> isFull [

		"Return true if stack is at maximum capacity"
	
	^ topIndex = capacity
]

{ #category : 'removing' }
CTStack >> pop [

	| element |
	self isEmpty ifTrue: [ self error: 'Stack is empty' ].
	
	element := elements at: topIndex.
	elements at: topIndex put: nil.  "Prevent memory leaks"
	topIndex := topIndex - 1.
	^ element
]

{ #category : 'adding' }
CTStack >> push: anObject [

	self isFull ifTrue: [ self error: 'Stack is full' ].
	
	topIndex := topIndex + 1.
	elements at: topIndex put: anObject.
	^ anObject
]

{ #category : 'showing' }
CTStack >> pushAll: aCollection [

	aCollection do: [ :each | self push: each ].
	^ aCollection isEmpty ifFalse: [ aCollection last ] ifTrue: [ nil ]
]

{ #category : 'removing' }
CTStack >> removeAll [

	1 to: topIndex do: [ :i | elements at: i put: nil ].
	topIndex := 0
]

{ #category : 'accessing' }
CTStack >> search: anObject [

	"Return the 1-based position of anObject from the top of the stack.
	Return -1 if the object is not found.
	The top element is at position 1."
	
	self isEmpty ifTrue: [ ^ -1 ].
	
	topIndex to: 1 by: -1 do: [ :i |
		(elements at: i) = anObject ifTrue: [ 
			^ topIndex - i + 1 
		]
	].
	^ -1
]

{ #category : 'accessing' }
CTStack >> size [

	^ topIndex 
]

{ #category : 'accessing' }
CTStack >> top [

	"Return the top element without removing it"
	
	self isEmpty ifTrue: [ self error: 'Stack is empty' ].
	^ elements at: topIndex
]
