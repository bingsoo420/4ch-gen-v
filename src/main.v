module main

struct Thread {
	thread_number int    [json: no]
	title         string [json: sub]
	name          string
}

struct Page {
	page    int
	threads []Thread
}

fn main() {
	catalog := read_json[[]Page]('./fixtures/g_catalog.json') or { panic(err) }
	println(catalog)
}
