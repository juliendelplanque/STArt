Class {
	#name : #STArtDBLPExplorerSpec,
	#superclass : #ComposablePresenter,
	#instVars : [
		'model',
		'urlTextInput',
		'results',
		'searchButton',
		'importButton'
	],
	#category : #'STArt-Importer-Spec'
}

{ #category : #specs }
STArtDBLPExplorerSpec class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: [ :searchRow |
					searchRow
						newColumn: #urlTextInput;
						newColumn: #searchButton width: 100 ] height: self buttonHeight;
				newRow: #results;
				newRow: #importButton height: self buttonHeight ]
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> importButton [
	^ importButton
]

{ #category : #actions }
STArtDBLPExplorerSpec >> importSelectedPaper [
	| dblpXml |
	self results selectedItem ifNil: [ self error: 'Not item selected.' ].

	dblpXml := (((self results selectedItem allElementsDetect: [ :n | n name = 'info' ]) allElementsDetect: [ :n | n name = 'url' ]) contentString trimmed , '.xml') asZnUrl retrieveContents.
	
	(STArtDBLPImporterSpec on: self model)
		xmlContent: dblpXml;
		openWithSpec
]

{ #category : #initialization }
STArtDBLPExplorerSpec >> initialize [
	super initialize.
	self title: 'Explore DBLP'
]

{ #category : #initialization }
STArtDBLPExplorerSpec >> initializeWidgets [
	urlTextInput := self newTextInput.
	searchButton := self newButton.
	results := self newList.
	importButton := self newButton.
	
	urlTextInput autoAccept: true.
	searchButton
		label: 'Search';
		action: [ self searchDBLPAndFillResults ].
	results
		displayBlock: [ :item |
			item ifNotNil: [ (item allElementsDetect: [ :n | n name = 'title' ]) contentString trimmed , ' - ' , (item allElementsDetect: [ :n | n name = 'year' ]) contentString trimmed , ' - ' , (((item allElementsSelect: [ :n | n name = 'author' ]) collect: [ :n | n contentString trimmed ] as: OrderedCollection) joinUsing: ', ') ] ];
		whenSelectedItemChanged: [ :item |
			importButton enabled: item isNotNil ].
		
	importButton
		label: 'Import selected paper';
		action: [ 
			self importSelectedPaper ]
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> model [
	^ model
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> model: anObject [
	model := anObject
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> results [
	^ results
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> searchButton [
	^ searchButton
]

{ #category : #actions }
STArtDBLPExplorerSpec >> searchDBLPAndFillResults [
	| s |
	s := ('https://dblp.uni-trier.de/search/publ/api' asZnUrl
			queryAt: 'q' put: self urlTextInput getText asString;
			queryAt: 'h' put: '1000';
			queryAt: 'format' put: 'xml';
			retrieveContents) parseXML.
	
	results resetSelection.
	results items: (s allElementsSelect: [ :n | n name = 'hit' ]).
]

{ #category : #'model access' }
STArtDBLPExplorerSpec >> setModelBeforeInitialization: aModel [
	self model: aModel
]

{ #category : #accessing }
STArtDBLPExplorerSpec >> urlTextInput [
	^ urlTextInput
]
