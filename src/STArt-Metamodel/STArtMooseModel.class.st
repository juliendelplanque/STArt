Class {
	#name : #STArtMooseModel,
	#superclass : #MooseModel,
	#category : #'STArt-Metamodel'
}

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

{ #category : #'serialize/materialize' }
STArtMooseModel >> serializeOn: stream [
	stream nextPutAll: '<start>'; nextPutAll: Smalltalk os lineEnding.
	(self allWithSubTypesOf: STArtPaperMetaDataSource)
		do: [ :source |
			source serializeOn: stream.
			stream nextPutAll: Smalltalk os lineEnding ].
	stream nextPutAll: '</start>'; nextPutAll: Smalltalk os lineEnding.
]
