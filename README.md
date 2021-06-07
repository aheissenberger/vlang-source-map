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

[auto generated documentation](https://github.com/aheissenberger/vlang-source-map-module/blob/master/_docs/sourcemap.md#contents)
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
