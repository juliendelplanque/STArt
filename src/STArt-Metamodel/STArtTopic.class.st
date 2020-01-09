Class {
	#name : #STArtTopic,
	#superclass : #STArtNamedEntity,
	#instVars : [
		'#incomingReferences => FMMany type: #STArtTopicReference opposite: #topic'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtTopic class >> annotation [

	<MSEClass: #Topic super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtTopic >> incomingReferences [
	"Relation named: #incomingReferences type: #STArtTopicReference opposite: #topic"

	<generated>
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
