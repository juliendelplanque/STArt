Class {
	#name : #STArtEntitiesLinker,
	#superclass : #ComposablePresenter,
	#instVars : [
		'entityToCreateLinkFrom',
		'listOfEntities',
		'addLinkButton'
	],
	#category : #'STArt-Importer-Spec'
}

{ #category : #specs }
STArtEntitiesLinker class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: #listOfEntities;
				newRow: #addLinkButton height: self buttonHeight ]
]

{ #category : #accessing }
STArtEntitiesLinker >> addLinkButton [
	^ addLinkButton
]

{ #category : #initialization }
STArtEntitiesLinker >> candidateEntitiesToLinkTo [
	^ self subclassResponsibility
]

{ #category : #checking }
STArtEntitiesLinker >> checkEntityIsSelected [
	self listOfEntities selectedItem
		ifNil: [ self error: 'No entity selected' ]
]

{ #category : #adding }
STArtEntitiesLinker >> createLinkToSelectedEntity [
	self subclassResponsibility
]

{ #category : #accessing }
STArtEntitiesLinker >> entityToCreateLinkFrom [
	^ entityToCreateLinkFrom
]

{ #category : #accessing }
STArtEntitiesLinker >> entityToCreateLinkFrom: anObject [
	entityToCreateLinkFrom := anObject
]

{ #category : #initialization }
STArtEntitiesLinker >> initializeWidgets [
	listOfEntities := self newList.
	listOfEntities
		items: self candidateEntitiesToLinkTo.
	addLinkButton := self newButton.
	addLinkButton
		action: [ self createLinkToSelectedEntity ]
]

{ #category : #accessing }
STArtEntitiesLinker >> listOfEntities [
	^ listOfEntities
]

{ #category : #'model access' }
STArtEntitiesLinker >> setModelBeforeInitialization: aModel [
	self entityToCreateLinkFrom: aModel
]
