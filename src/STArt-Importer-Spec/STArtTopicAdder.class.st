Class {
	#name : #STArtTopicAdder,
	#superclass : #STArtEntitiesLinker,
	#category : #'STArt-Importer-Spec'
}

{ #category : #initialization }
STArtTopicAdder >> candidateEntitiesToLinkTo [
	^ self entityToCreateLinkFrom mooseModel topics \ self entityToCreateLinkFrom topics
]

{ #category : #adding }
STArtTopicAdder >> createLinkToSelectedEntity [
	self checkEntityIsSelected.
	self entityToCreateLinkFrom
		addTopic: self listOfEntities selectedItem.
	self delete
]

{ #category : #initialization }
STArtTopicAdder >> initialize [
	super initialize.
	self title: 'Add topic'
]

{ #category : #initialization }
STArtTopicAdder >> initializeWidgets [
	super initializeWidgets.
	listOfEntities displayBlock: [ :p | p name , ' - ' , p topicDescription ].
	addLinkButton label: 'Add topic'
]
