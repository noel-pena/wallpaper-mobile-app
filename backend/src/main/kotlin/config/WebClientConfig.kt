package wallpaper.config

import org.springframework.context.annotation.*
import org.springframework.web.reactive.function.client.WebClient

@Configuration
class WebClientConfig {

    @Bean
    fun webClient(): WebClient {
        return WebClient.builder().build()
    }
}