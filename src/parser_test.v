module main

struct TestCase {
	gen  string
	want int
}

fn test_it_correctly_parse_generals() {
	tests := {
		'g':   24
		'fit': 7
		'biz': 14
	}

	for gen, expected in tests {
		catalog := read_json[[]Page]('./fixtures/${gen}_catalog.json') or { panic(err) }
		generals := build_generals(gen, catalog)
		assert expected == generals.len
	}
}

fn test_it_parse_valid_subjects() {
	tests := {
		'this is a long /general/': 'general'
		'/wdg/':                    'wdg'
	}

	for title, expected in tests {
		found, general := parse_general(title)
		assert found
		assert general == expected
	}
}

fn test_it_doest_not_arse_invalid_subjects() {
	tests := [
		'almost a /general',
		'',
	]
	for title in tests {
		found, _ := parse_general(title)
		assert found == false
	}
}
