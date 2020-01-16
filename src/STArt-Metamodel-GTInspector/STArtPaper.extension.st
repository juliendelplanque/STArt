Extension { #name : #STArtPaper }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtAuthorsIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self gtShowAuthorsIn: composite)
		title: 'Authors';
		display: [ self authors ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtCitedPapersIn: composite [
	<gtInspectorPresentationOrder: 1> 
	^ (self gtShowPapersIn: composite)
		title: 'Cited Papers';
		display: [ self citedPapers ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtCitingPapersIn: composite [
	<gtInspectorPresentationOrder: 2> 
	^ (self gtShowPapersIn: composite)
		title: 'Citing Papers';
		display: [ self citingPapers ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtInspectorActionAddCitedPaper [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			(STArtCitationAdder on: self) openWithSpec ];
		icon: (self iconNamed: #up);
		title: 'Add cited paper'
]
