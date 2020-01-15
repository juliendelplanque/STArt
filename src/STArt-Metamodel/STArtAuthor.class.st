Class {
	#name : #STArtAuthor,
	#superclass : #STArtNamedEntity,
	#instVars : [
		'#wrote => FMMany type: #STArtWrote opposite: #author'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtAuthor class >> annotation [

	<FMClass: #Author super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #adding }
STArtAuthor >> addWrote: anObject [
	<generated>
	^ self wrote add: anObject
]

{ #category : #'as yet unclassified' }
STArtAuthor >> gtWrittenPapersIn: composite [
	<gtInspectorPresentationOrder: 11> 
	^ composite fastTable
		title: 'Written Papers';
		display: [ self writtenPapers ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | paper title ] width: 400;
		column: 'Year' evaluated: [ :paper | paper year ] width: 40;
		column: 'Authors' evaluated: [ :paper | paper authorNamesSeparatedByColons ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]

{ #category : #testing }
STArtAuthor >> isAuthor [

	<generated>
	^ true
]

{ #category : #accessing }
STArtAuthor >> writtenPapers [
	^ self wrote collect: #paper
]

{ #category : #accessing }
STArtAuthor >> wrote [
	"Relation named: #wrote type: #STArtWrote opposite: #author"

	<generated>
	<derived>
	^ wrote
]

{ #category : #accessing }
STArtAuthor >> wrote: anObject [

	<generated>
	wrote value: anObject
]

{ #category : #'model building' }
STArtAuthor >> wrotePaper: aPaper [
	^ STArtWrote new
		mooseModel: self mooseModel;
		paper: aPaper;
		author: self;
		yourself
]
