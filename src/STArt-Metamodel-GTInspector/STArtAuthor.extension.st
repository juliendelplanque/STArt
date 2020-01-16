Extension { #name : #STArtAuthor }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtAuthor >> gtWrittenPapersIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self gtShowPapersIn: composite)
		title: 'Written Papers';
		display: [ self writtenPapers ];
		yourself
]
