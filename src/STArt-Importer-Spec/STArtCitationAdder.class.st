Class {
	#name : #STArtCitationAdder,
	#superclass : #STArtEntitiesLinker,
	#category : #'STArt-Importer-Spec'
}

{ #category : #initialization }
STArtCitationAdder >> candidateEntitiesToLinkTo [
	^ self entityToCreateLinkFrom mooseModel papers
		\ self entityToCreateLinkFrom citedPapers
		\ {self entityToCreateLinkFrom}
		select: [ :p | p year <= self entityToCreateLinkFrom year ]
]

{ #category : #adding }
STArtCitationAdder >> createLinkToSelectedEntity [
	self checkEntityIsSelected.
	self entityToCreateLinkFrom
		addCitedPaper: self listOfEntities selectedItem.
	self delete
]

{ #category : #initialization }
STArtCitationAdder >> initialize [
	super initialize.
	self title: 'Add citation'
]

{ #category : #initialization }
STArtCitationAdder >> initializeWidgets [
	super initializeWidgets.
	listOfEntities displayBlock: [ :p | p title , ', ' , p year asString , ', ' , p authorNamesSeparatedByColons ].
	addLinkButton label: 'Add citation'
]
