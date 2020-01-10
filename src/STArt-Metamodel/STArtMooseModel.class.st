Class {
	#name : #STArtMooseModel,
	#superclass : #MooseModel,
	#category : #'STArt-Metamodel'
}

{ #category : #importing }
STArtMooseModel class >> importFromFile: aFileReference [
	^ aFileReference readStreamDo: [ :stream |
		self importFromMSEStream: stream ]
]

{ #category : #combining }
STArtMooseModel class >> meta [
	^ STArtMetamodelGenerator metamodel
]

{ #category : #querying }
STArtMooseModel >> authors [
	^ self allWithType: STArtAuthor
]

{ #category : #initialization }
STArtMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #STArtMetamodelGenerator) metamodel
]

{ #category : #querying }
STArtMooseModel >> papers [
	^ self allWithType: STArtPaper
]

{ #category : #saving }
STArtMooseModel >> saveInFile: aFileReference [
	aFileReference exists
		ifTrue: [ self error: 'File already exists.' ].
	
	aFileReference writeStreamDo: [ :stream |
		self exportToMSEStream: stream ]
]

{ #category : #'serialize/materialize' }
STArtMooseModel >> serializeOn: stream [
	stream nextPutAll: '<start>'; nextPutAll: Smalltalk os lineEnding.
	(self allWithSubTypesOf: STArtPaperMetaDataSource)
		do: [ :source |
			source serializeOn: stream.
			stream nextPutAll: Smalltalk os lineEnding ].
	stream nextPutAll: '</start>'; nextPutAll: Smalltalk os lineEnding.
]
