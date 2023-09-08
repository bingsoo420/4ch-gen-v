module main

import regex

const re_general = r'/\w+/'

fn parse_general(title string) (bool, string) {
	mut re := regex.regex_opt(re_general) or { return false, '' }
	start, end := re.find(title)
	if start != -1 && end != -1 {
		return true, title[start+1..end-1].to_lower()
	}
	return false, ''
}

fn build_generals(board string, catalog []Page) map[string]string {
	mut general := map[string]string{}
	for page in catalog {
		for t in page.threads {
			found, gen := parse_general(t.title)
			if found {
				general[gen] = 'https://boards.4chan.org/${board}/thread/${t.no}'
			}
		}
	}

	return general
}
