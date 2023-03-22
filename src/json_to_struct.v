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
	for file.read(mut buf)! == buf.len {
		payload << buf
	}
	payload << buf

	return json.decode(T, payload.bytestr())!
}
