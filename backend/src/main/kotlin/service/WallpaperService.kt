package org.example.service

import org.example.model.Wallpaper
import kotlinx.serialization.json.Json
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.reactive.function.client.bodyToMono
import reactor.core.publisher.Mono

@Service
class WallpaperService(private val WebClient: WebClient) {
}