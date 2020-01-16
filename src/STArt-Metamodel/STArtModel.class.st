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

{ #category : #querying }
STArtModel >> publicationTargets [
	^ self allWithSubTypesOf: STArtPublicationTarget
]

{ #category : #saving }
STArtModel >> saveInFile: aFileReference [
	aFileReference exists
		ifTrue: [ self error: 'File already exists.' ].
	
	aFileReference writeStreamDo: [ :stream |
		self exportToMSEStream: stream ]
]

{ #category : #saving }
STArtModel >> saveNewVersionInDirectory: aFileReference [
	"Save the model as MSE file in aFileReference directory.
	 Create a file named 'start-yyyy-mm-dd.hh-MM-ss.mse'
	 With
		- yyyy being the year at saving
		- mm being the month at saving
		- dd being the day at saving
		- hh being the hour at saving
		- MM being the minute at saving
		- ss being the second at saving
	This method allow to version the model in a simple way.
	"
	^ self saveInFile: aFileReference asFileReference / ('start-' , DateAndTime now asFileNameCompatibleString , '.mse')
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
