if !exists(':Tabularize')
	finish " Give up here; the Tabular plugin musn't have been loaded
endif

" => Tabular additions
AddTabularPattern align_hash /\(:.*\)\@<!:\zs /l0
