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

const targets = ['g']

fn main() {
	catalog := read_json[[]Page]('./fixtures/g_catalog.json') or { panic(err) }
	genz := build_generals('g', catalog)
	println(genz)
}
