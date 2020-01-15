Extension { #name : #STArtAuthor }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtAuthor >> gtWrittenPapersIn: composite [
	<gtInspectorPresentationOrder: 11> 
	^ (self gtShowPapersIn: composite)
		title: 'Written Papers';
		display: [ self writtenPapers ];
		yourself
]
