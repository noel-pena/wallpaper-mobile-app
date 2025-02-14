package org.example.model

import kotlinx.serialization.Serializable

@Serializable
data class Thumbs(
    val large: String,
    val original: String,
    val small: String
)

@Serializable
data class WallpaperData(
    val path: String,
)

@Serializable
data class WallhavenWallpaperData(
    val path: String,
)

@Serializable
data class SearchResponse(val data: List<WallhavenWallpaperData>)
