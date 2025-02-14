package org.example.service

import kotlinx.serialization.json.Json
import org.example.model.*
import org.example.model.WallpaperData
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.reactive.function.client.bodyToMono
import reactor.core.publisher.Mono

private val json = Json {
    ignoreUnknownKeys = true
}

@Service
class WallpaperService(private val webClient: WebClient) {

    fun getRandomWallpaper(apiKey: String? = null): Mono<WallpaperData?> {
        val url = "https://wallhaven.cc/api/v1/search?sorting=random" + if (apiKey != null) "?apiKey=$apiKey" else ""

        return webClient.get()
            .uri(url)
            .retrieve()
            .bodyToMono<String>()
            .mapNotNull { jsongString ->
                try {
                    val response = json.decodeFromString<SearchResponse>(jsongString)
                    response.data.firstOrNull()?.toWallpaper()
                } catch (e: Exception) {
                    println("Error decoding JSON: ${e.message}")
                    null
                }
            }
            .onErrorResume { e ->
                println("Error fetching Wallpaper: ${e.message}")
                Mono.justOrEmpty(null)
            }
    }

    private fun WallpaperData.toWallpaper(): WallpaperData = WallpaperData(path)
}