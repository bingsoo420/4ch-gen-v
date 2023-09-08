module main

import os
import json

fn read_json[T](path string) !T {
	mut file := os.open(path)!
	defer {
		file.close()
	}

	mut payload := []u8{}
	mut buf := []u8{len: 100}
	for !file.eof() {
		file.read(mut buf)!
		payload << buf
	}

	return json.decode(T, payload.bytestr())!
}
