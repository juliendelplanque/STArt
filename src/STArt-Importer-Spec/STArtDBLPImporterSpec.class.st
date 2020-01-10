Class {
	#name : #STArtDBLPImporterSpec,
	#superclass : #ComposablePresenter,
	#instVars : [
		'inputText',
		'importButton',
		'model'
	],
	#category : #'STArt-Importer-Spec'
}

{ #category : #specs }
STArtDBLPImporterSpec class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: #inputText;
				newRow: #importButton height: self buttonHeight ]
]

{ #category : #accessing }
STArtDBLPImporterSpec >> importButton [
	^ importButton
]

{ #category : #initialization }
STArtDBLPImporterSpec >> initialize [
	super initialize.
	self title: 'Import DBLP record'
]

{ #category : #initialization }
STArtDBLPImporterSpec >> initializeWidgets [
	inputText := self newTextInput.
	inputText autoAccept: true.
	
	importButton := self newButton.
	
	importButton
		label: 'Import!';
		action: [ 
			STArtDBLPRecordImporter import: self inputText getText asString in: self model.
			self delete ]
]

{ #category : #accessing }
STArtDBLPImporterSpec >> inputText [
	^ inputText
]

{ #category : #accessing }
STArtDBLPImporterSpec >> model [
	^ model
]

{ #category : #accessing }
STArtDBLPImporterSpec >> model: anObject [
	model := anObject
]

{ #category : #'model access' }
STArtDBLPImporterSpec >> setModelBeforeInitialization: aModel [
	self model: aModel
]

{ #category : #accessing }
STArtDBLPImporterSpec >> xmlContent: aString [
	self inputText text: aString
]
