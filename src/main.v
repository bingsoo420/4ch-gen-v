module main

struct Thread {
	no    int
	title string [json: sub]
	name  string
}

struct Page {
	page    int
	threads []Thread
}

fn main() {
	catalog := read_json[[]Page]('./fixtures/g_catalog.json') or { panic(err) }
	generals := build_generals('g', catalog)

	println(generals)
}
