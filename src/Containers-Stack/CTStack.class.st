"
I implement a simple Stack. 

- #push: adds a new object of any kind on top of the stack. 
- #pop returns the first element and remove it from the stack. 
- #top answer the first element of the stack without removing it.
"
Class {
	#name : #CTStack,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Containers-Stack'
}

{ #category : #'instance creation' }
CTStack class >> new: aNumber [

	^ self basicNew
			initializeWith: aNumber;
			yourself
			  
]

{ #category : #query }
CTStack >> capacity [

	^  elements capacity
]

{ #category : #testing }
CTStack >> ifEmpty: aBlock [
	"Execute the given block, answering its value if the receiver is empty, otherwise answer the receiver."
	
	"Note that the fact that this method returns its receiver in case the receiver is not empty allows one to write expressions like the following ones: self classifyMethodAs: (myProtocol ifEmpty: ['As yet unclassified'])"

	^ elements ifEmpty: aBlock ifNotEmpty: [ self ]
]

{ #category : #testing }
CTStack >> ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2 [ 
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"
	"If the notEmptyBlock has an argument, execute with the receiver as its argument"
	
	^ elements ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2
]

{ #category : #testing }
CTStack >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ elements ifNotEmpty: aBlock ifEmpty: [ self ]
]

{ #category : #testing }
CTStack >> ifNotEmpty: aBlockClosure ifEmpty: aBlockClosure2 [ 
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, execute with the receiver as its argument"
	
	^ elements ifNotEmpty: aBlockClosure ifEmpty: aBlockClosure2
]

{ #category : #initialization }
CTStack >> initialize [

	super initialize.
	elements := OrderedCollection new
]

{ #category : #initialization }
CTStack >> initializeWith: aNumber [
	"Pre allocate the number of elements in the underlying data structure to avoid growing it multiple time when dealing with large stacks."
	
	elements := OrderedCollection new: aNumber
]

{ #category : #testing }
CTStack >> isEmpty [ 
	
	^ elements isEmpty
]

{ #category : #operations }
CTStack >> pop [
	"Returns the first element and remove it from the receiver."

	^ elements removeFirst 
]

{ #category : #operations }
CTStack >> push: anObject [ 
	"Adds a new object of any kind on top of the receiver."
	
	elements addFirst: anObject.
	^ anObject
]

{ #category : #query }
CTStack >> size [

	^ elements size
]

{ #category : #operations }
CTStack >> top [
	"Answer the first element of the receiver without removing it."
	
	^ elements first
]
