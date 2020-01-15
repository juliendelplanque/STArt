Class {
	#name : #STArtModel,
	#superclass : #MooseModel,
	#category : #'STArt-Metamodel-Model'
}

{ #category : #accessing }
STArtModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
STArtModel class >> annotation [
	<FMClass: #STArtModel super: #MooseModel>
	<package: #'STArt-Metamodel'>
	<generated>
]

{ #category : #importing }
STArtModel class >> importFromFile: aFileReference [
	^ aFileReference asFileReference readStreamDo: [ :stream |
		self importFromMSEStream: stream ]
]

{ #category : #querying }
STArtModel >> authors [
	^ self allWithType: STArtAuthor
]

{ #category : #querying }
STArtModel >> papers [
	^ self allWithType: STArtPaper
]

{ #category : #saving }
STArtModel >> saveInFile: aFileReference [
	aFileReference exists
		ifTrue: [ self error: 'File already exists.' ].
	
	aFileReference writeStreamDo: [ :stream |
		self exportToMSEStream: stream ]
]

{ #category : #'serialize/materialize' }
STArtModel >> serializeOn: stream [
	stream nextPutAll: '<start>'; nextPutAll: Smalltalk os lineEnding.
	(self allWithSubTypesOf: STArtPaperMetaDataSource)
		do: [ :source |
			source serializeOn: stream.
			stream nextPutAll: Smalltalk os lineEnding ].
	stream nextPutAll: '</start>'; nextPutAll: Smalltalk os lineEnding.
]
