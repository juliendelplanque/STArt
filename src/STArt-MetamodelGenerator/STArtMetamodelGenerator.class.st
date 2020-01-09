Class {
	#name : #STArtMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'author',
		'paper',
		'topic',
		'wrote',
		'citation',
		'topicReference',
		'entity',
		'namedEntity',
		'paperMetaDataSource',
		'paperMetaDataStringSource'
	],
	#category : #'STArt-MetamodelGenerator'
}

{ #category : #accessing }
STArtMetamodelGenerator class >> basicMetamodelClasses [

	| classes |
	
	classes := super basicMetamodelClasses.	
	classes addAll: self basicFamixTraits.
	
	^ classes
]

{ #category : #generation }
STArtMetamodelGenerator class >> generate [
	<script>
	super generate
]

{ #category : #accessing }
STArtMetamodelGenerator class >> packageName [

	^ #'STArt-Metamodel'
]

{ #category : #accessing }
STArtMetamodelGenerator class >> prefix [

	^ #'STArt'
]

{ #category : #accessing }
STArtMetamodelGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
STArtMetamodelGenerator >> defineClasses [
	super defineClasses.
	entity := builder newClassNamed: #Entity.
	namedEntity := builder newClassNamed: #NamedEntity.
	
	author := builder newClassNamed: #'Author'.
	paper :=  builder newClassNamed: #'Paper'.
	topic := builder newClassNamed: #'Topic'.
	paperMetaDataSource := builder newClassNamed: #'PaperMetaDataSource'.
	paperMetaDataStringSource := builder newClassNamed: #'PaperMetaDataStringSource'.
	
	wrote := builder newClassNamed: #'Wrote'.
	citation := builder newClassNamed: #'Citation'.
	topicReference := builder newClassNamed: #'TopicReference'.
	
	author withTesting.
	paper withTesting.
	topic withTesting
]

{ #category : #definition }
STArtMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	namedEntity --|> #TNamed.
	namedEntity --|> entity.
	namedEntity --|> #TDependencyQueries.
	namedEntity --|> #TEntityMetaLevelDependency.
	
	author --|> namedEntity.
	paper --|> entity.
	topic --|> namedEntity.
	paperMetaDataSource --|> entity.
	paperMetaDataStringSource --|> paperMetaDataSource.
	
	topicReference --|> entity.
	wrote --|> entity.
	citation --|> entity
]

{ #category : #definition }
STArtMetamodelGenerator >> defineProperties [
	super defineProperties.
		
	paper
		property: #title type: #String;
		property: #filePath type: #String;
		property: #year type: #Number.
		
	paperMetaDataStringSource
		property: #content type: #String
]

{ #category : #definition }
STArtMetamodelGenerator >> defineRelations [
	super defineRelations.
	
	(author property: #wrote)
		-* (wrote property: #author).
		
	(paper property: #written)
		-* (wrote property: #paper).
		
	(paper property: #outgoingTopicReferences)
		-* (topicReference property: #paper).
		
	(paper property: #source)
		- (paperMetaDataSource property: #relatedPaper).
		
	(topic property: #incomingReferences)
		-* (topicReference property: #topic).
]
