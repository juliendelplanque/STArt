Extension { #name : #STArtMooseModel }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtMooseModel >> gtAuthorsIn:  composite [
	<gtInspectorPresentationOrder: 0> 
	^ composite fastTable
		title: 'Authors';
		display: [ self authors ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :author | GTObjectPrinter asTruncatedTextFrom: author name ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtMooseModel >> gtPapersIn:  composite [
	<gtInspectorPresentationOrder: 0> 
	^ composite fastTable
		title: 'Papers';
		display: [ self papers ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | GTObjectPrinter asTruncatedTextFrom: paper title ];
		column: 'Year' evaluated: [ :paper | GTObjectPrinter asTruncatedTextFrom: paper year ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
