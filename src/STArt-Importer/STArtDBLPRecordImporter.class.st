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
	rawAuthors := (soup findAllTags: 'author') collect: #string.
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
STArtDBLPRecordImporter >> import [
	| xml paper source |
	xml := self parseXMLString.
	source := self newPaperMetaDataStringSource.
	source content: self xmlString.
	paper := self newPaper.
	paper
		title: (xml findTag: 'title') string trimmed;
		year: (xml findTag: 'year') string trimmed asInteger;
		source: source.
		
	self addAuthorsFrom: xml to: paper.
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
	| soup |
	soup := Soup fromString: self xmlString.
	self assert: soup children first name = 'dblp'.
	^ soup
]

{ #category : #accessing }
STArtDBLPRecordImporter >> xmlString [
	^ xmlString
]

{ #category : #accessing }
STArtDBLPRecordImporter >> xmlString: anObject [
	xmlString := anObject
]
