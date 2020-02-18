Extension { #name : #STArtTopic }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtTopic >> gtPapersIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (STArtInspectorExtensionBuilder gtShowPapersIn: composite)
		title: 'Papers';
		display: [ self papers ];
		yourself
]
