package org.example.model

import kotlinx.serialization.Serializable

@Serializable
data class Wallpaper(
    val id: String,
    val url: String,
    val path: String,
    val thumbs: Thumbs
)

@Serializable
data class Thumbs(
    val large: String,
    val original: String,
    val small: String,
)