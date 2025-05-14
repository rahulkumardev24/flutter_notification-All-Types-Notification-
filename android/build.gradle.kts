/*
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}
// for notification
buildscript {

    dependencies {
        classpath 'com.android.tools.build:gradle:8.6.0'
    }

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
*/
import org.gradle.api.tasks.Delete
import org.gradle.api.Project
import org.gradle.api.artifacts.dsl.RepositoryHandler
import org.gradle.api.initialization.dsl.ScriptHandler
import org.gradle.kotlin.dsl.* // For DSL features
import java.io.File

// Top-level build file
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.2.0") // ✅ Recommended stable version
        // ⚠️ Flutter handles Kotlin plugins, so no need for additional ones
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Move build directory outside for CI/CD use case or separate build
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(name)
    layout.buildDirectory.set(newSubprojectBuildDir)
    evaluationDependsOn(":app")
}

// ✅ Optional: clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
