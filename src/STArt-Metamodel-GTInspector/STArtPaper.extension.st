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
