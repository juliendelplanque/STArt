Class {
	#name : #STArtCitationAdder,
	#superclass : #ComposablePresenter,
	#instVars : [
		'paperToAddCitationTo',
		'listOfPapers',
		'addCitationButton'
	],
	#category : #'STArt-Importer-Spec'
}

{ #category : #specs }
STArtCitationAdder class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: #listOfPapers;
				newRow: #addCitationButton height: self buttonHeight ]
]

{ #category : #accessing }
STArtCitationAdder >> addCitationButton [
	^ addCitationButton
]

{ #category : #adding }
STArtCitationAdder >> addSelectedPaperAsCitation [
	self listOfPapers selectedItem
		ifNil: [ self error: 'No paper selected' ].
		
	self paperToAddCitationTo addCitedPaper: self listOfPapers selectedItem.
	self delete.
]

{ #category : #initialization }
STArtCitationAdder >> initialize [
	super initialize.
	self title: 'Add citation'
]

{ #category : #initialization }
STArtCitationAdder >> initializeWidgets [
	listOfPapers := self newList.
	listOfPapers
		displayBlock: [ :p |
			p ifNotNil: [ p title ] ];
		items: ((self paperToAddCitationTo mooseModel papers
					\ self paperToAddCitationTo citedPapers
					\ { self paperToAddCitationTo }) select: [ :p | p year <= self paperToAddCitationTo year ]).
	
	addCitationButton := self newButton.
	
	addCitationButton
		label: 'Add citation';
		action: [ self addSelectedPaperAsCitation ]
]

{ #category : #accessing }
STArtCitationAdder >> listOfPapers [
	^ listOfPapers
]

{ #category : #accessing }
STArtCitationAdder >> paperToAddCitationTo [
	^ paperToAddCitationTo
]

{ #category : #accessing }
STArtCitationAdder >> paperToAddCitationTo: anObject [
	paperToAddCitationTo := anObject
]

{ #category : #'model access' }
STArtCitationAdder >> setModelBeforeInitialization: aModel [
	self paperToAddCitationTo: aModel
]
