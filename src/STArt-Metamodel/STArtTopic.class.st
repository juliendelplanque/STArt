Class {
	#name : #STArtTopic,
	#superclass : #STArtNamedEntity,
	#instVars : [
		'#incomingReferences => FMMany type: #STArtTopicReference opposite: #topic',
		'#topicDescription => FMProperty'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtTopic class >> annotation [

	<FMClass: #Topic super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #adding }
STArtTopic >> addIncomingReference: anObject [
	<generated>
	^ self incomingReferences add: anObject
]

{ #category : #accessing }
STArtTopic >> incomingReferences [
	"Relation named: #incomingReferences type: #STArtTopicReference opposite: #topic"

	<generated>
	<derived>
	^ incomingReferences
]

{ #category : #accessing }
STArtTopic >> incomingReferences: anObject [

	<generated>
	incomingReferences value: anObject
]

{ #category : #testing }
STArtTopic >> isTopic [

	<generated>
	^ true
]

{ #category : #accessing }
STArtTopic >> papers [
	^ self incomingReferences collect: #paper
]

{ #category : #accessing }
STArtTopic >> papersCount [
	^ self papers size
]

{ #category : #accessing }
STArtTopic >> topicDescription [

	<FMProperty: #topicDescription type: #String>
	<generated>
	^ topicDescription
]

{ #category : #accessing }
STArtTopic >> topicDescription: anObject [
	<generated>
	topicDescription := anObject
]
