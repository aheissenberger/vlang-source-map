module sourcemap
import x.json2


struct V3 {
	SourceMap
pub:
	sections []Section [json: sections]
}

struct Offset {
pub mut:
	line   int [json: line]
	column int [json: column]
}

struct Section {
pub mut:
	offset     Offset    [json: offset]
	source_map SourceMap [json: map]
}

struct Generator {
mut:
	file string
	// source_root string
	sections []Section
}

pub fn generate_empty_map() ?&Generator {
	return &Generator{}
}

pub fn (mut g Generator) add_map(file string,source_root string, line_offset int, column_offset int) &SourceMap {
	source_map := new_sourcemap(file,source_root)

	offset := Offset{
		line: line_offset
		column: column_offset
	}

	g.sections << Section{
		offset: offset
		source_map: source_map
	}

	return &source_map
}

pub fn (mut g Generator) to_json_string(file string){
	mut source_map_json := map[string]json2.Any{}
	source_map_json['version']=g.sections[0].source_map.version
	source_map_json['file']=file
	source_map_json['sourceRoot']=g.sections[0].source_map.source_root
	source_map_json['sources']=g.sections[0].source_map.source_root
	source_map_json['sourcesContent']=g.sections[0].source_map.source_root
	source_map_json['names']=g.sections[0].source_map.source_root
	source_map_json['mappings']=g.sections[0].source_map.source_root



}
