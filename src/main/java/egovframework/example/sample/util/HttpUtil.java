/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.util;
import java.io.IOException;

import org.springframework.stereotype.Component;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Component
public class HttpUtil {
	public static MediaType JSON = MediaType.parse("application/json; charset=utf-8");
	
	public static OkHttpClient client = new OkHttpClient();
	
	public static String get(String url) throws IOException {
		Request request = new Request.Builder()
		.url(url)
		.build();
		try (Response response = client.newCall(request).execute()) {
			return response.body().string();
		}
	}
	
	public static String post(String url, Object json) throws IOException {
		RequestBody body = RequestBody.create(JSON, JsonUtil.toJson(json));
		
		Request request = new Request.Builder()
			.url(url)
			.post(body)
			.build();
		try (Response response = client.newCall(request).execute()) {
			return response.body().string();
		}
	}
	
	public static String put(String url, Object json) throws IOException {
		RequestBody body = RequestBody.create(JSON, JsonUtil.toJson(json));
		
		Request request = new Request.Builder()
				.url(url)
				.put(body)
				.build();
		try (Response response = client.newCall(request).execute()) {
			return response.body().string();
		}
	}
	
	public static String delete(String url) throws IOException {
		Request request = new Request.Builder()
				.url(url)
				.delete()
				.build();
		try (Response response = client.newCall(request).execute()) {
			return response.body().string();
		}
	}
	
}
