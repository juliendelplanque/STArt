Extension { #name : #STArtPublicationTarget }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPublicationTarget >> gtAuthorsIn: composite [
	<gtInspectorPresentationOrder: 1> 
	^ (self gtShowAuthorsIn: composite)
		title: 'Authors';
		display: [ self authors ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPublicationTarget >> gtPapersIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self gtShowPapersIn: composite)
		title: 'Papers';
		display: [ self papers ];
		yourself
]
