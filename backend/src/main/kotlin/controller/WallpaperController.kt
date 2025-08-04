package wallpaper.controller

import wallpaper.service.WallpaperService
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/api/wallpapers")
class WallpaperController(private val wallpaperService: WallpaperService) {

    @GetMapping("/random", produces = [MediaType.APPLICATION_JSON_VALUE])
    fun getRandomWallpaper(
        @RequestHeader("X-API-Key", required = false) apiKey: String?,
        @RequestParam("resolutions", required = false) resolutions: String?
    ): Mono<String?> {
        return wallpaperService.getRandomWallpaper(apiKey, resolutions)
    }
}