package wallpaper.service

import kotlinx.serialization.json.Json
import wallpaper.model.*
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.*
import reactor.core.publisher.Mono

private val json = Json {
    ignoreUnknownKeys = true
}

@Service
class WallpaperService(private val webClient: WebClient) {

    fun getRandomWallpaper(
        apiKey: String? = null,
        resolutions: String? = null
    ): Mono<String?> {
        val baseUrl = "https://wallhaven.cc/api/v1/search?sorting=random"
        val url = buildString {
            append(baseUrl)
            if (apiKey != null) {
                append("&apikey=$apiKey")
            }
            if (resolutions != null) {
                val parts = resolutions.split("x")
                if (parts.size == 2) {
                    append("&resolutions=$resolutions")
                } else if (resolutions.contains(":")) {
                    append("&rations=$resolutions")
                }
            }
        }

        return webClient.get()
            .uri(url)
            .retrieve()
            .bodyToMono<String>()
            .mapNotNull { jsongString ->
                try {
                    val response = json.decodeFromString<SearchResponse>(jsongString)
                    response.data.firstOrNull()?.toWallpaper()?.path
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

    private fun WallpaperData.toWallpaper() = WallpaperData(path)
}