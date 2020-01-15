Class {
	#name : #STArtInspectorExtensionBuilder,
	#superclass : #Object,
	#category : #'STArt-Metamodel-GTInspector'
}

{ #category : #'extension building' }
STArtInspectorExtensionBuilder class >> gtShowPapersIn: composite [
	"Builds a fast table configured to display papers data.
	 The goal for this method is to avoid duplicating the code everywhere as paper
	 tab is something often needed in inspector views.
	"
	^ composite fastTable
		title: 'Papers';
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
					ifFalse: [self species withAll: result]]];
		yourself
]