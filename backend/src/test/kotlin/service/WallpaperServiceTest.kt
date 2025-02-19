import kotlinx.serialization.json.Json
import okhttp3.mockwebserver.MockResponse
import okhttp3.mockwebserver.MockWebServer
import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.junit.jupiter.MockitoExtension
import org.springframework.http.HttpHeaders
import org.springframework.http.MediaType
import org.springframework.web.reactive.function.client.WebClient
import wallpaper.model.*
import wallpaper.service.WallpaperService

@ExtendWith(MockitoExtension::class)
class WallpaperServiceTest {

    private lateinit var mockWebServer: MockWebServer

    @InjectMocks
    private lateinit var wallpaperService: WallpaperService

    private lateinit var webClient: WebClient

    private val json = Json { ignoreUnknownKeys = true }

    @BeforeEach
    fun setUp() {
        mockWebServer = MockWebServer()
        mockWebServer.start()

        webClient = WebClient.builder()
            .baseUrl(mockWebServer.url("/"))
            .build()

        wallpaperService = WallpaperService(webClient)
    }

    @AfterEach
    fun tearDown() {
        mockWebServer.shutdown()
    }

    @Test
    fun `getRandomWallpaper - success`() {
        val mockResponse = """
            {
              "data": [
                {
                  "id": "someId",
                  "url": "someUrl",
                  "path": "https://w.wallhaven.cc/full/xy/wallhaven-xy1234.jpg",
                  "thumbs": {
                    "large": "someLargeThumb",
                    "original": "someOriginalThumb",
                    "small": "someSmallThumb"
                  }
                }
              ]
            }
        """.trimIndent()

        mockWebServer.enqueue(
            MockResponse()
                .addHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .setBody(mockResponse)
        )

        val result = wallpaperService.getRandomWallpaper().block()

        assertNotNull(result)
        assertEquals("https://w.wallhaven.cc/full/xy/wallhaven-xy1234.jpg", result?.path)
    }

    @Test
    fun `getRandomWallpaper - error`() {
        mockWebServer.enqueue(MockResponse().setResponseCode(500))

        val result = wallpaperService.getRandomWallpaper().block()

        assertNull(result)
    }
}