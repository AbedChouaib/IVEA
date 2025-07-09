### 🧠 Java Plugin for IVEA (ImageJ)

This folder contains the Java code for the **IVEA ImageJ plugin**, designed to work with deep learning models for vesicle event analysis. The plugin is compatible with **ImageJ/Fiji** and integrates deep learning inference using **TensorFlow** and **DL4J**.

---

### ⚙️ Build Configuration

#### **Java Version**

The plugin is built using **Java 1.8**:

```xml
<properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
</properties>
```

---

### 📦 Maven Dependencies

The following dependencies are used for building and running the plugin:

#### **ImageJ Core**

```xml
<dependency>
    <groupId>net.imagej</groupId>
    <artifactId>ij</artifactId>
    <version>1.54c</version> <!--$NO-MVN-MAN-VER$-->
</dependency>
```

#### **Deep Learning Libraries**

```xml
<!-- DeepLearning4J Core -->
<dependency>
    <groupId>org.deeplearning4j</groupId>
    <artifactId>deeplearning4j-core</artifactId>
    <version>1.0.0-M1.1</version>
</dependency>

<!-- TensorFlow Java bindings -->
<dependency>
    <groupId>org.tensorflow</groupId>
    <artifactId>tensorflow</artifactId>
    <version>1.15.0</version> <!--$NO-MVN-MAN-VER$-->
</dependency>

<dependency>
    <groupId>org.tensorflow</groupId>
    <artifactId>libtensorflow_jni</artifactId>
    <version>1.15.0</version> <!--$NO-MVN-MAN-VER$-->
</dependency>
```

> ⚠️ **Note:** These dependencies are confirmed to be functional and should not be modified unless you are adapting to a different runtime or backend.

---

### 📁 Directory Structure and Runtime Notes

This project includes **two essential directories** that must be bundled with the plugin JAR for it to function properly:

1. **`org/`**
   Contains critical Java classes and resources for **DL4J** and **TensorFlow** compatibility.

2. **`tensorflow/`**
   Includes required native libraries for TensorFlow Java bindings.

> ⚠️ The `.rar` files found inside the `org/` directory and the tensorflow.rar file must be **extracted** before compiling your plugin. These contain pre-compiled classes necessary for neural network inference.

---

### 🧪 Plugin Compilation

To compile the ImageJ plugin into a JAR:

1. Make sure both `org/` and `tensorflow/` directories are **included in your project structure**.
2. Extract any compressed `.rar` archives before building.
3. Package all dependencies into the final `.jar` file to ensure full portability within **ImageJ/Fiji**.

---

### 💡 Alternative Option: ONNX Runtime (Future Plan)

Although the current implementation uses TensorFlow 1.15 and DL4J, an alternative approach using **ONNX Runtime** is being explored. ONNX allows exporting TensorFlow models and running them efficiently in Java, potentially enabling a cleaner and more modern integration pipeline.

---

### 🧹 Compatibility

* **Tested with:** ImageJ 1.54c
* **Build Tool:** Maven
* **Runtime Compatibility:** Java 8, TensorFlow 1.15, DeepLearning4J 1.0.0-M1.1
* **Platforms:** Cross-platform (Windows/Linux/macOS)
