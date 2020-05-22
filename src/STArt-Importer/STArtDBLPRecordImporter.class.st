Class {
	#name : #STArtDBLPRecordImporter,
	#superclass : #Object,
	#instVars : [
		'xmlString',
		'model'
	],
	#category : #'STArt-Importer'
}

{ #category : #importing }
STArtDBLPRecordImporter class >> import: xmlString in: model [
	^ self new
		xmlString: xmlString;
		model: model;
		import
]

{ #category : #importing }
STArtDBLPRecordImporter >> addAuthorsFrom: soup to: paper [
	| rawAuthors |
	rawAuthors := (soup allElementsSelect: [ :n | n name = 'author' ]) collect: [ :n | n contentString trimmed ].
	rawAuthors do: [ :rawAuthor |
		self newWrote
			author: ((self model allWithType: STArtAuthor)
							detect: [ :author | author name = rawAuthor ]
							ifNone: [ 
								self newAuthor
									name: rawAuthor;
									yourself ]);
			paper: paper ]
]

{ #category : #importing }
STArtDBLPRecordImporter >> addBookPaperFrom: xml to: paper [
	| bookName |
	bookName := (xml allElementsDetect: [ :n | n name = 'title' ]) contentString trimmed.
	
	paper publicationTarget: ((self model allWithType: STArtBook)
		detect: [ :journal | journal name = bookName ]
		ifNone: [ 
			self newBook
				name: bookName;
				yourself ])
]

{ #category : #importing }
STArtDBLPRecordImporter >> addConferenceOrWorkshopPaperFrom: xml to: paper [
	| conferenceName |
	conferenceName := (xml allElementsDetect: [ :n | n name = 'booktitle' ]) contentString trimmed.
	
	paper publicationTarget: ((self model allWithType: STArtConference)
		detect: [ :conference | conference name = conferenceName ]
		ifNone: [ 
			self newConference
				name: conferenceName;
				yourself ])
]

{ #category : #importing }
STArtDBLPRecordImporter >> addJournalPaperFrom: xml to: paper [
	| journalName |
	journalName := (xml allElementsDetect: [ :n | n name = 'journal' ]) contentString trimmed.
	
	paper publicationTarget: ((self model allWithType: STArtJournal)
		detect: [ :journal | journal name = journalName ]
		ifNone: [ 
			self newJournal
				name: journalName;
				yourself ])
]

{ #category : #importing }
STArtDBLPRecordImporter >> addPublicationTargetFrom: xml to: paper [
	(xml allElementsDetect: [ :n | n name = 'inproceedings' ])
		ifNotNil: [ 
			^ self addConferenceOrWorkshopPaperFrom: xml to: paper ].
		
	(xml allElementsDetect: [ :n | n name = 'article' ])
		ifNotNil: [ 
			^ self addJournalPaperFrom: xml to: paper ].
		
	(xml allElementsDetect: [ :n | n name = 'book' ])
		ifNotNil: [ 
			^ self addBookPaperFrom: xml to: paper ].
		
	self error: 'Unknown publication target type for entry to import.'
]

{ #category : #importing }
STArtDBLPRecordImporter >> import [
	| xml paper source |
	xml := self parseXMLString.
	source := self newPaperMetaDataStringSource.
	source content: self xmlString.
	paper := self newPaper.
	paper
		title: (xml allElementsDetect: [ :n | n name = 'title' ]) contentString trimmed;
		year: (xml allElementsDetect: [ :n | n name = 'year' ]) contentString trimmed asInteger;
		source: source.
		
	self addAuthorsFrom: xml to: paper.
	self addPublicationTargetFrom: xml to: paper.
	^ paper
]

{ #category : #accessing }
STArtDBLPRecordImporter >> model [
	^ model
]

{ #category : #accessing }
STArtDBLPRecordImporter >> model: anObject [
	model := anObject
]

{ #category : #factory }
STArtDBLPRecordImporter >> newAuthor [
	^ STArtAuthor new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newBook [
	^ STArtBook new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newConference [
	^ STArtConference new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newJournal [
	^ STArtJournal new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newPaper [
	^ STArtPaper new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newPaperMetaDataStringSource [
	^ STArtPaperMetaDataStringSource new
		mooseModel: self model;
		yourself
]

{ #category : #factory }
STArtDBLPRecordImporter >> newWrote [
	^ STArtWrote new
		mooseModel: self model;
		yourself
]

{ #category : #parsing }
STArtDBLPRecordImporter >> parseXMLString [
	| xml |
	xml := self xmlString parseXML.
	self assert: (xml nodes anySatisfy: [ :child | child name = 'dblp' ]).
	^ xml
]

{ #category : #accessing }
STArtDBLPRecordImporter >> xmlString [
	^ xmlString
]

{ #category : #accessing }
STArtDBLPRecordImporter >> xmlString: anObject [
	xmlString := anObject
]
