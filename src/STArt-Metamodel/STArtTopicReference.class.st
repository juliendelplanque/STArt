Class {
	#name : #STArtTopicReference,
	#superclass : #STArtEntity,
	#instVars : [
		'#paper => FMOne type: #STArtPaper opposite: #outgoingTopicReferences',
		'#topic => FMOne type: #STArtTopic opposite: #incomingReferences'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtTopicReference class >> annotation [

	<FMClass: #TopicReference super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtTopicReference >> paper [
	"Relation named: #paper type: #STArtPaper opposite: #outgoingTopicReferences"

	<generated>
	^ paper
]

{ #category : #accessing }
STArtTopicReference >> paper: anObject [

	<generated>
	paper := anObject
]

{ #category : #accessing }
STArtTopicReference >> topic [
	"Relation named: #topic type: #STArtTopic opposite: #incomingReferences"

	<generated>
	^ topic
]

{ #category : #accessing }
STArtTopicReference >> topic: anObject [

	<generated>
	topic := anObject
]
