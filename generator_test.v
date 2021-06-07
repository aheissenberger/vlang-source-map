module sourcemap

struct TestWriter {
pub mut:
	bytes []byte
}

fn test_dev() {
	mut sg := generate_empty_map() or { panic('broken') }
	mut sm := sg.add_map('', 0, 0)

	// sm.add_mapping('hello.v', SourcePosition{source_line:1,source_column:0},0, 0, '')
	// sm.add_mapping('hello.v', Empty{},1, 0, '')
	expected_vlq_mappping:='AAAA;AAAA,EAAA,OAAO,CAAC,GAAR,CAAY,aAAZ,CAAA,CAAA;AAAA'
	mlist := [
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 1
				gen_column: 0
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 0
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 2
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 9
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 7
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 10
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 8
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 13
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 14
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 12
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 27
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 28
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 2
				gen_column: 29
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
		MappingInput{
			GenPosition: GenPosition{
				gen_line: 3
				gen_column: 0
			}
			name: ''
			source_position: SourcePosition{
				source_line: 1
				source_column: 0
			}
		},
	]
	sm.add_mapping_list('hello.v', mlist) or {panic('x')}

	a := sm.mappings.get_sorted_array()
	// dump(a)
	for variable in a {
		dump(variable)
	}
	mut output := TestWriter{}
	sm.export_mappings(mut &output)
	println('EXP: "$expected_vlq_mappping"')
	println('ERG: "$output.bytes.bytestr()"')
	assert output.bytes.bytestr() == expected_vlq_mappping
}

fn (mut w TestWriter) write(buf []byte) ?int {
	w.bytes << buf
	return buf.len
}