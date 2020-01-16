Class {
	#name : #BaselineOfSTArt,
	#superclass : #BaselineOf,
	#category : #BaselineOfSTArt
}

{ #category : #baselines }
BaselineOfSTArt >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'STArt-MetamodelGenerator' with: [ spec requires: #('Famix') ];
				package: 'STArt-Metamodel' with: [ spec requires: #('Famix') ];
				package: 'STArt-Metamodel-GTInspector' with: [ spec requires: #('STArt-Metamodel') ];
				package: 'STArt-Metamodel-Tests' with: [ spec requires: #('STArt-Metamodel') ];
				package: 'STArt-Importer' with: [ spec requires: #('STArt-Metamodel' 'XMLParser') ];
				package: 'STArt-Importer-Spec' with: [ spec requires: #('STArt-Importer') ];
				package: 'STArt-Importer-Tests' with: [ spec requires: #('STArt-Importer') ].
			spec
				baseline: 'XMLParser'
				with: [ spec repository: 'github://pharo-contributions/XML-XMLParser:0effb9130748e417844886b3cb5992644757b206/src' ].
			spec
    			baseline: 'Famix'
    			with: [ spec repository: 'github://jecisc/Famix:v5.x.x/src' ] ]
]
