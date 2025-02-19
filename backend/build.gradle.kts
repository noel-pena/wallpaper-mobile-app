plugins {
    kotlin("jvm") version "2.0.21"
    id("org.springframework.boot") version "3.4.2"
    id("io.spring.dependency-management") version "1.1.0"
    kotlin("plugin.spring") version "1.9.20"
    kotlin("plugin.serialization") version "1.9.20"
}

group = "wallpaper"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-web:3.4.2")
    implementation("org.springframework.boot:spring-boot-starter-webflux:3.4.2")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")
    implementation("org.jetbrains.kotlin:kotlin-reflect")
    implementation("io.netty:netty-resolver-dns-native-macos:4.1.99.Final")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.10.0")
    testImplementation("org.junit.jupiter:junit-jupiter-engine:5.10.0")
    testImplementation("org.mockito:mockito-core:5.0.0")
    testImplementation("org.mockito:mockito-junit-jupiter:5.0.0")
    testImplementation("com.squareup.okhttp3:okhttp-mockwebserver:4.11.0")
    testImplementation("com.squareup.okhttp3:okhttp:4.11.0")
    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude(group = "org.junit", module = "junit")
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(21)
    compilerOptions {
        freeCompilerArgs = listOf("-Xjsr305=strict")
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_21
}
}