module sourcemap
import io
const (
	source_map_version = 3
)

struct SourceMap {
pub mut:
	version         int               [json: version]
	file            string            [json: file]
	source_root     string            [json: source_root]
	sources         Sets              [json: sources]
	sources_content map[string]string
	names           Sets
	mappings        Mappings
}

pub fn new_sourcemap(source_root string) SourceMap {
	return SourceMap{
		version: sourcemap.source_map_version
		mappings: new_mappings()
	}
}

// Add a single mapping from original source line and column to the generated source's line and column for this source map being created.
pub fn (mut sm SourceMap) add_mapping(source_name string, source_position SourcePositionType, gen_line u32, gen_column u32, name string) {
	assert source_name.len != 0

	sources_ind := sm.sources.add(source_name)

	names_ind := if name.len != 0 {
		NameIndexType(IndexNumber(sm.names.add(name)))
	} else {
		NameIndexType(Empty{})
	}
	sm.mappings.add_mapping(gen_line, gen_column, sources_ind, source_position, names_ind)
}

// Add multiple mappings from the same source
pub fn (mut sm SourceMap) add_mapping_list(source_name string, mapping_list []MappingInput) ? {
	assert source_name.len != 0

	sources_ind := sm.sources.add(source_name)

	for mapping in mapping_list {
		names_ind := if mapping.name.len != 0 {
			NameIndexType(IndexNumber(sm.names.add(mapping.name)))
		} else {
			NameIndexType(Empty{})
		}
		sm.mappings.add_mapping(mapping.gen_line, mapping.gen_column, sources_ind, mapping.source_position,
			names_ind)
	}
}

// Set the source content for a source file.
pub fn (mut sm SourceMap) set_source_content(source_name string, source_content string) {
	sm.sources_content[source_name] = source_content
}

pub fn (mut sm SourceMap) export_mappings(mut writer io.Writer){

	sm.mappings.export_mappings(mut writer) or {panic('export failed')}
}

