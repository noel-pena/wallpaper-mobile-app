package org.example.controller

import org.example.model.WallpaperData
import org.example.service.WallpaperService
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/api/wallpapers")
class WallpaperController(private val wallpaperService: WallpaperService) {

    @GetMapping("/random", produces = [MediaType.APPLICATION_JSON_VALUE])
    fun getRandomWallpaper(
        @RequestHeader("X-API-Key", required = false) apiKey: String?
    ): Mono<WallpaperData?> {
        return wallpaperService.getRandomWallpaper(apiKey)
    }
}