<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png">
      <img alt="Flutter" src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png">
    </picture>
  </h1>
</a>

# Flutter Template

Bienvenido a la plantilla Flutter, una base sólida para construir aplicaciones con Flutter. Esta plantilla está diseñada para proporcionar una estructura organizada y eficiente para el desarrollo de aplicaciones móviles, permitiéndote centrarte en la creación de características innovadoras y una experiencia de usuario de alta calidad.

![Stripe](https://img.shields.io/badge/Stripe-7455E8?style=for-the-badge&logo=Stripe&logoColor=white)
![Socket.io](https://img.shields.io/badge/Socket.io-000000?style=for-the-badge&logo=Socket.io&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-4887E7?style=for-t∏he-badge&logo=Firebase&logoColor=F4D208)
![Gitlab](https://img.shields.io/badge/Gitlab-FFFFFF?style=for-the-badge&logo=Gitlab&logoColor=#D74A2C)
![Mockito](https://img.shields.io/badge/Mockito-DBDFFF?style=for-the-badge&logo=Dart&logoColor=black)
![Realm](https://img.shields.io/badge/Realm-3948BB?style=for-the-badge&logo=Realm&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=Microsoft-Azure&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-0D5C63?style=for-the-badge&logo=Riverpod&logoColor=white)
![Dynatrace](https://img.shields.io/badge/Dynatrace-1E3A8A?style=for-the-badge&logo=Dynatrace&logoColor=white)




## Descripción

Esta aplicación Flutter es una plataforma robusta y escalable diseñada para acelerar el desarrollo de aplicaciones modernas. Con un diseño modular y extensible, es adecuada para diversos proyectos como comercio electrónico, productividad o medios. La plantilla ofrece una base sólida con mejores prácticas, herramientas avanzadas y dependencias poderosas como Riverpod para gestión de estado y configuraciones optimizadas para APIs y servicios HTTP. Además, soporta autenticación segura, notificaciones push, testing automatizado, y facilita la integración de CI/CD. Ideal tanto para desarrolladores individuales como equipos, esta plantilla proporciona la infraestructura necesaria para crear aplicaciones escalables y adaptables.

## Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Contribución](#contribución)
- [Licencia](#licencia)

## Requisitos Previos

Antes de iniciar la aplicación, asegúrate de cumplir con los siguientes requisitos:

  - **Dart SDK**: Asegúrate de tener el SDK de Dart instalado.
  - **Flutter SDK**: Necesitas tener Flutter SDK instalado. Si no lo tienes, puedes seguir la [guía de instalación oficial de Flutter](https://flutter.dev/docs/get-started/install).
  - **Xcode (opcional para iOS)**: Si deseas ejecutar la aplicación en un dispositivo iOS, necesitarás Xcode instalado en tu máquina macOS.
  - **Android Studio**: Para ejecutar la aplicación en un dispositivo Android, asegúrate de tener Android Studio configurado.

## Validar Instalación con `flutter doctor`

  Antes de comenzar, asegúrate de que tu entorno de desarrollo está correctamente configurado ejecutando el siguiente comando:

  ```bash
  flutter doctor
  ```

  Si todo está bien configurado, deberías ver un mensaje similar a este:

  ```bash
  Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.27.1, on macOS 15.2 24C101 darwin-arm64, locale es-ES)
[✓] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 16.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.1)
[✓] VS Code (version 1.96.1)
[✓] Connected device (5 available)
[✓] Network resources
  ```


## Instalación

1. **Clona este repositorio :**

   ```bash
   git clone https://github.com/SangheliosBlack/Flutter-Template.git
   ```

2. **Instala las dependencias :**

   ```bash
   flutter pub get
   ```

### 3. **Configuración de Variables de Entorno**

Dentro de la carpeta `env` en el directorio raíz, deberás crear un archivo llamado `dev.json`. Este archivo debe seguir el siguiente formato de ejemplo:


```json
{
  "PATH_URL": "PATH_URL": "https://ejemplo.com/api",
  "PORT": "",          //Solo para conexión local
  "ENVIRONMENT": "np", //No productivo - np | Productivo - p 
  "API_VERSION": "v1"
}
```
Puedes basarte en el archivo dev_example.json proporcionado para crear tu archivo dev.json, ajustando las variables de acuerdo con tu configuración.

## Iniciar la aplicación

### Configuración de lanzamiento

En el archivo `launch.json` se definen las configuraciones de lanzamiento para ejecutar la aplicación Flutter en diferentes entornos. Hay dos configuraciones disponibles:

1. **Template Flutter (DEV)**: Para ejecutar la aplicación en modo desarrollo en dispositivos móviles.
2. **Template Flutter Web (DEV)**: Para ejecutar la aplicación en un navegador web en modo desarrollo.

### Para iniciar la aplicación:

#### En dispositivos móviles (Flutter):
Utiliza la configuración `"Template Flutter (DEV)"` que incluye los siguientes parámetros:
- **`--dart-define-from-file=env/dev.json`**: Carga las variables de entorno definidas en el archivo `dev.json`.
- **`--flavor Development`**: Establece el sabor de la aplicación como `Development` para configurar el entorno de desarrollo.

Para iniciar la aplicación, puedes ejecutar desde VS Code o desde la terminal con el siguiente comando:

```bash
flutter run --dart-define-from-file=env/dev.json --flavor Development
```

## Estructura del Proyecto

La estructura sigue los principios de **Clean Architecture** para mantener las responsabilidades bien definidas en cada capa. A continuación se describe la organización del proyecto:

```plaintext
/lib
  ├── core
  │   ├── error
  │   ├── usecases
  │   └── utils
  ├── features
  │   ├── auth
  │   │   ├── data
  │   │   │   ├── datasources
  │   │   │   ├── models
  │   │   │   └── repositories
  │   │   ├── domain
  │   │   │   ├── entities
  │   │   │   ├── repositories
  │   │   │   └── usecases
  │   │   ├── presentation
  │   │   │   ├── pages
  │   │   │   └── blocs
  │   │   └── auth.dart
  │   ├── home
  │   ├── payment
  │   └── user
  ├── main.dart
  ├── routes.dart
  └── themes.dart
```

## Generación Automática de Código con `build_runner` en Riverpod

### ¿Qué es `build_runner`?

`build_runner` es una herramienta en Flutter/Dart que permite generar automáticamente código, lo que simplifica tareas repetitivas como la creación de providers y otros artefactos. En el contexto de Riverpod, `build_runner` se utiliza para generar los archivos relacionados con los providers usando el generador de código de Riverpod.

### ¿Cómo se usa `build_runner` con Riverpod?

Para usar el generador de código de Riverpod y generar providers automáticamente, sigue estos pasos:

1. **Añadir dependencias a `pubspec.yaml` (Ya esta añadido)**

   Primero, necesitas agregar las dependencias necesarias en tu archivo `pubspec.yaml`:

   ```yaml
   dev_dependencies:
    flutter_riverpod_generator: ^2.0.0  # Dependencia del generador de Riverpod
     build_runner: ^2.0.0  # Herramienta para generar el código
    ```
2. **Ejecutar el comando de generación de código**

   Una vez que hayas añadido las dependencias, ejecuta el siguiente comando en tu terminal para generar el código automáticamente:


   ```bash
   
   dart run build_runner build
   ```
  
   Este comando buscará los archivos que tienen las anotaciones correspondientes (como @riverpod en los providers) y generará el código necesario en archivos .g.dart. Estos archivos contienen la implementación de los providers y otros artefactos generados.

# Contribución

Si deseas contribuir a este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -am 'Agregando nueva funcionalidad'`).
4. Haz push a la rama (`git push origin feature/nueva-funcionalidad`).
5. Crea un Pull Request.

## Contribuidores

[![Julio Villagrana](https://avatars.githubusercontent.com/u/50421116?s=96&v=4)](https://github.com/SangheliosBlack)

# Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.