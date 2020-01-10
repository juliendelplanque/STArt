Class {
	#name : #STArtPaper,
	#superclass : #STArtEntity,
	#instVars : [
		'#filePath => FMProperty',
		'#incomingCitations => FMMany type: #STArtCitation opposite: #targetPaper',
		'#outgoingCitations => FMMany type: #STArtCitation opposite: #sourcePaper',
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

{ #category : #editing }
STArtPaper >> addCitedPaper: aPaper [
	^ STArtCitation new
		mooseModel: self mooseModel;
		sourcePaper: self;
		targetPaper: aPaper;
		yourself
]

{ #category : #editing }
STArtPaper >> addCitingPaper: aPaper [
	^ STArtCitation new
		mooseModel: self mooseModel;
		sourcePaper: aPaper;
		targetPaper: self;
		yourself
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
STArtPaper >> citedPapers [
	"Returns the papers I cite.
	 That is to say papers appearing in my bibliography.
	"
	^ self outgoingCitations collect: #targetPaper
]

{ #category : #accessing }
STArtPaper >> citingPapers [
	"Returns the papers citing myself.
	 That is to say papers for which I appear in their bibliography.
	"
	^ self incomingCitations collect: #sourcePaper
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

{ #category : #accessing }
STArtPaper >> incomingCitations [
	"Relation named: #incomingCitations type: #STArtCitation opposite: #targetPaper"

	<generated>
	^ incomingCitations
]

{ #category : #accessing }
STArtPaper >> incomingCitations: anObject [

	<generated>
	incomingCitations value: anObject

]

{ #category : #testing }
STArtPaper >> isPaper [

	<generated>
	^ true
]

{ #category : #accessing }
STArtPaper >> outgoingCitations [
	"Relation named: #outgoingCitations type: #STArtCitation opposite: #sourcePaper"

	<generated>
	^ outgoingCitations
]

{ #category : #accessing }
STArtPaper >> outgoingCitations: anObject [

	<generated>
	outgoingCitations value: anObject

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
