package wallpaper.model

import kotlinx.serialization.Serializable

@Serializable
data class WallpaperData(val path: String)

@Serializable
data class SearchResponse(val data: List<WallpaperData>)
