Extension { #name : #STArtPublicationTarget }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPublicationTarget >> gtPapersIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self gtShowPapersIn: composite)
		title: 'Papers';
		display: [ self papers ];
		yourself
]
