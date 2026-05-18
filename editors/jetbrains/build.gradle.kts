plugins {
    id("java")
    id("org.jetbrains.intellij.platform") version "2.1.0"
}

group = "com.atlaskaisar"
version = "1.0.0"

repositories {
    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

dependencies {
    intellijPlatform {
        intellijIdeaCommunity("2024.1")
    }
}

intellijPlatform {
    pluginConfiguration {
        ideaVersion {
            sinceBuild.set("241")
            untilBuild.set(provider { null })
        }
    }

    publishing {
        token.set(System.getenv("JETBRAINS_MARKETPLACE_TOKEN") ?: "")
    }
}

tasks {
    wrapper {
        gradleVersion = "8.10"
    }

    patchPluginXml {
        version.set(project.version.toString())
    }
}
