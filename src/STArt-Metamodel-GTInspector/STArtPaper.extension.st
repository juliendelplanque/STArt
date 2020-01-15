Extension { #name : #STArtPaper }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtAuthorsIn:  composite [
	<gtInspectorPresentationOrder: 10> 
	^ composite fastTable
		title: 'Authors';
		display: [ self authors ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :author | author name ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtCitedPapersIn: composite [
	<gtInspectorPresentationOrder: 11> 
	^ (self gtShowPapersIn: composite)
		title: 'Cited Papers';
		display: [ self citedPapers ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtCitingPapersIn: composite [
	<gtInspectorPresentationOrder: 12> 
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
