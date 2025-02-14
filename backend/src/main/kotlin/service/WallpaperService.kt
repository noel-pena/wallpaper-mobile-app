package org.example.service

import kotlinx.serialization.json.Json
import org.example.model.*
import org.example.model.WallpaperData
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.reactive.function.client.bodyToMono
import reactor.core.publisher.Mono

// TODO: Path URL uses an ID in the following format: "https://w.wallhaven.cc/full/[first two index of id]/wallhaven-[id].jpg"

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
                    val response = Json{ ignoreUnknownKeys = true }.decodeFromString<SearchResponse>(jsongString)
                    response.data.firstOrNull()?.toWallpaper()
                } catch (e: Exception) {
                    println("Error decoding JSON: ${e.message}")
                    null
                }
            }
            .onErrorResume { e ->
                println("Error fetching Wallpaper: ${e.message}")
                Mono.just(null)
            }
    }

    private fun WallhavenWallpaperData.toWallpaper(): WallpaperData =
        WallpaperData(path)

}