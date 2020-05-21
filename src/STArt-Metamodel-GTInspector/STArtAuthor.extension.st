Extension { #name : #STArtAuthor }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtAuthor >> gtAuthorsIn: composite [
	<gtInspectorPresentationOrder: 1> 
	^ (STArtInspectorExtensionBuilder gtShowAuthorsIn: composite)
		title: 'Co-authors';
		display: [ self coAuthors ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtAuthor >> gtPublicationTargetsIn: composite [
	<gtInspectorPresentationOrder: 2> 
	^ (STArtInspectorExtensionBuilder gtPublicationTargetsIn: composite)
		title: 'Publication targets';
		display: [ self publicationTargets ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtAuthor >> gtWrittenPapersIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self gtShowPapersIn: composite)
		title: 'Written Papers';
		display: [ self writtenPapers ];
		yourself
]
