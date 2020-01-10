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
	^ composite fastTable
		title: 'Cited Papers';
		display: [ self citedPapers ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | paper title ] width: 400;
		column: 'Year' evaluated: [ :paper | paper year ] width: 40;
		column: 'Authors' evaluated: [ :paper | paper authorNamesSeparatedByColons ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaper >> gtCitingPapersIn: composite [
	<gtInspectorPresentationOrder: 12> 
	^ composite fastTable
		title: 'Citing Papers';
		display: [ self citingPapers ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | paper title ] width: 400;
		column: 'Year' evaluated: [ :paper | paper year ] width: 40;
		column: 'Authors' evaluated: [ :paper | paper authorNamesSeparatedByColons ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
