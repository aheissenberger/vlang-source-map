# module sourcemap

# sourcemap

Generate source maps.

## Installation


```sh
v install aheissenberger.sourcemap
```

## Usage

### Generator

```v
	mut sg := generate_empty_map() or { panic('broken') }
	mut sm := sg.add_map('hello.js', '/', 0, 0)
	sm.add_mapping('hello.v', SourcePosition{
		source_line: 0
		source_column: 0
	}, 1, 1, '')
	sm.add_mapping('hello_lib1.v', SourcePosition{
		source_line: 0
		source_column: 0
	}, 2, 1, '')
	sm.add_mapping('hello_lib2.v', SourcePosition{
		source_line: 0
		source_column: 0
	}, 3, 1, '')
	json_data := sm.to_json()

	expected := '{"version":3,"file":"hello.js","sourceRoot":"\\/","sources":["hello.v","hello_lib1.v","hello_lib2.v"],"sourcesContent":[null,null,null],"names":[],"mappings":"CA+\\/\\/\\/\\/\\/HA;CCAA;CCAA"}'
	assert json_data.str() == expected
```
### Consumer

not implemented

## API Documentation

[auto generated documentation](https://github.com/aheissenberger/vlang-source-map/blob/master/_docs/sourcemap.md#contents)
(created `v doc -f md -m . -o .`)

### Roadmap

 - [ ] implement consumer
 - [ ] performance benchmark
 - [ ] rewrite with streaming to IO

### Contribution

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
1. Create your Feature Branch (git checkout -b feature/AmazingFeature)
1. Commit your Changes (git commit -m 'Add some AmazingFeature')
1. Push to the Branch (git push origin feature/AmazingFeature)
1. Open a Pull Request

### License

Distributed under the "bsd-2-clause" License. See [LICENSE.txt](LICENSE.txt) for more information.
 

## Contents
- [generate_empty_map](#generate_empty_map)
- [new_sourcemap](#new_sourcemap)
- [Generator](#Generator)
  - [add_map](#add_map)
- [SourceMap](#SourceMap)
  - [add_mapping](#add_mapping)
  - [add_mapping_list](#add_mapping_list)
  - [set_source_content](#set_source_content)
  - [to_json](#to_json)
- [SourcePosition](#SourcePosition)

## generate_empty_map
```v
fn generate_empty_map() &Generator
```


[[Return to contents]](#Contents)

## new_sourcemap
```v
fn new_sourcemap(file string, source_root string) SourceMap
```


[[Return to contents]](#Contents)

## Generator
## add_map
```v
fn (mut g Generator) add_map(file string, source_root string, line_offset int, column_offset int) &SourceMap
```


[[Return to contents]](#Contents)

## SourceMap
## add_mapping
```v
fn (mut sm SourceMap) add_mapping(source_name string, source_position SourcePositionType, gen_line u32, gen_column u32, name string)
```
 Add a single mapping from original source line and column to the generated source's line and column for this source map being created. 

[[Return to contents]](#Contents)

## add_mapping_list
```v
fn (mut sm SourceMap) add_mapping_list(source_name string, mapping_list []MappingInput) ?
```
 Add multiple mappings from the same source 

[[Return to contents]](#Contents)

## set_source_content
```v
fn (mut sm SourceMap) set_source_content(source_name string, source_content string)
```
 Set the source content for a source file. 

[[Return to contents]](#Contents)

## to_json
```v
fn (mut sm SourceMap) to_json() SourceMapJson
```
 create a JSON representing the sourcemap  Sourcemap Specs http://sourcemaps.info/spec.html 

[[Return to contents]](#Contents)

## SourcePosition
```v
struct SourcePosition {
	source_line   u32
	source_column u32
}
```


[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 7 Jun 2021 23:45:00
