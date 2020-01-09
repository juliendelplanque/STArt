Class {
	#name : #STArtPaper,
	#superclass : #STArtEntity,
	#instVars : [
		'#filePath => FMProperty',
		'#outgoingTopicReferences => FMMany type: #STArtTopicReference opposite: #paper',
		'#source => FMOne type: #STArtPaperMetaDataSource opposite: #relatedPaper',
		'#title => FMProperty',
		'#written => FMMany type: #STArtWrote opposite: #paper',
		'#year => FMProperty'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtPaper class >> annotation [

	<MSEClass: #Paper super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #'model building' }
STArtPaper >> addTopic: aTopic [ 
	^ STArtTopicReference new
		mooseModel: self mooseModel;
		topic: aTopic;
		paper: self;
		yourself
]

{ #category : #accessing }
STArtPaper >> authorNamesSeparatedByColons [
	^ (self authors collect: #name) joinUsing: ', '
]

{ #category : #accessing }
STArtPaper >> authors [
	^ self written collect: #author
]

{ #category : #accessing }
STArtPaper >> filePath [

	<MSEProperty: #filePath type: #String>
	<generated>
	^ filePath
]

{ #category : #accessing }
STArtPaper >> filePath: anObject [

	<generated>
	filePath := anObject

]

{ #category : #testing }
STArtPaper >> isPaper [

	<generated>
	^ true
]

{ #category : #accessing }
STArtPaper >> outgoingTopicReferences [
	"Relation named: #outgoingTopicReferences type: #STArtTopicReference opposite: #paper"

	<generated>
	^ outgoingTopicReferences
]

{ #category : #accessing }
STArtPaper >> outgoingTopicReferences: anObject [

	<generated>
	outgoingTopicReferences value: anObject

]

{ #category : #accessing }
STArtPaper >> source [
	"Relation named: #source type: #STArtPaperMetaDataSource opposite: #relatedPaper"

	<generated>
	^ source
]

{ #category : #accessing }
STArtPaper >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
STArtPaper >> title [

	<MSEProperty: #title type: #String>
	<generated>
	^ title
]

{ #category : #accessing }
STArtPaper >> title: anObject [

	<generated>
	title := anObject

]

{ #category : #accessing }
STArtPaper >> written [
	"Relation named: #written type: #STArtWrote opposite: #paper"

	<generated>
	^ written
]

{ #category : #accessing }
STArtPaper >> written: anObject [

	<generated>
	written value: anObject

]

{ #category : #accessing }
STArtPaper >> year [

	<MSEProperty: #year type: #Number>
	<generated>
	^ year
]

{ #category : #accessing }
STArtPaper >> year: anObject [

	<generated>
	year := anObject

]
