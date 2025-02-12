plugins {
    kotlin("jvm") version "2.0.21"
    id("org.springframework.boot") version "3.4.2"
    id("io.spring.dependency-management") version "1.1.0"
    kotlin("plugin.spring") version "1.9.20"
    kotlin("plugin.serialization") version "1.9.20"
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-web:3.4.2")
    implementation("org.springframework.boot:spring-boot-starter-webflux:3.4.2")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(21)
}