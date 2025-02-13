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
    val id: String,
    val url: String,
    val path: String,
    val thumbs: Thumbs
)

@Serializable
data class WallhavenWallpaperData(
    val id: String,
    val url: String,
    val path: String,
    val thumbs: Thumbs
)

@Serializable
data class SearchResponse(val data: List<WallhavenWallpaperData>)
