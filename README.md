# Softnet Flutter APP SKELETON BY IO MERO

## INSTALLING

    - Clonar proyecto
    - Navegar hacia archivo pubspec.yaml para instalat paquetes ( CTRL + S )
    - Crear un archivo .env y copiar contenido del archivo .env.sample en caso de existir
    - El proyecto se ejecuta por defecto en modo dev, configuraciones de rutas y ambientes en el directorio /lib/config.dart
    - Se tiene activa la inyeccion de paquetes mediante Get it

    [GET IT] (https://pub.dev/packages/get_it)

## STATE MANAGMENT

    - EL proyecto usa Bloc, respetar la secuencia de inyeccion y los streams del mismo

## ROUTER
    
    - Archivo de configuracion dentro del directorio raiz ./routes/app_router.dart
    - La generacion de rutas automaticas se encuentra gestionado con Auto Route y el BuildRunner 
    - Para mejor optimizacion de rutas agregar el prefijo "Page" al finalizar el nombre del Widget para evitar conflictos con metodos futuros y mejor organizaciom ejem "dashbaordPage"
    - Parametros en rutas son agregados de manera autamica,nunca modificar el archivo app_router.gr.dart directamente
    - Para generar nuevas rutas ejecutar el comando "flutter packages pub run build_runner build --delete-conflicting-outputs"
    - Al modificar las rutas y sub-rutas los metodos para animar las transiciones se encuentras disponibles con CustomRoute instead AutoRoute defautl

    [AUTO ROUTE] (https://pub.dev/packages/auto_route)
    [BUILD RUNNER] (https://pub.dev/packages/build_runner)

## MODELS AND RESPONSE

    - Los respuestas se encuentran heredadas de una clase general "General Response" seguir el formato y el cast de la informacion por las request en el parametro T?
    - Agregar modelos para cada clase de respuesta y evitar usar propiedades indexadas

## ICONS & ADAPTATIVE FOREGROUNDS

    - La generacion de graficos para las diferentes tiendas son gestinados por el paquete Flutter Launcher Icons
    - Dado el siguiente ejemplo, de no agregar adaptive_icon_background o adaptive_icon_foreground  se tomara el valor de image_path para las diferentes plataformas seleccionadas

        image_path: "assets/images/icon.png"
        adaptive_icon_background: "assets/images/2.png"
        adaptive_icon_foreground: "assets/images/icon.png"
    
    [Flutter Launcher Icons] (https://pub.dev/packages/flutter_launcher_icons)

## STRIPE
    
    - La pasarela de pagos Stripe se encuentra habilitada, agregar la pk en uso al archivo .env dentro del directorio raiz del proyecto lib
    - Metodos de pago, confirmacion de intentPayment se configura mediante el SDK gestionado por el mismo Stripe, nunca evaluar metodos por peticiones HTTP O HHTPS para evitar conflictos con PCI 
    - A fin de pruebas anexo la lista de metodos de pago dados por el autor en la siguiete liga https://stripe.com/docs/testing

    [Flutter Stripe] (https://pub.dev/packages/flutter_stripe)

### SECURITY

    - Configurar certificados de acceso y la obtencion de la misma en el archivo ./lib/confi/load_certificate.dart
    - Servicio HHTP configurado en el archivo ./lib/services/http_services.dart no modoficar

## SOCKET SERVICE

    - El proyecto contiene el archivo de configuracion para comunicacion y el transporte mediante webSocket y Auto Connect
    - La version estable en modo produccion funciona como cliente en la version socket_io_client: ^2.0.0-beta.4-nullsafety.0 y "socket.io": "^4.5.0" de lado del servidor;

    [Socket io Client] (https://pub.dev/packages/socket_io_client)

### SCAFFOLD

    - El proyecto cuenta con sistema de login y register, configurar la ruta de inicio y ambiente para obtener acceso a los servicios
    - Dashboard con pages basicas para el funcionamiento de nested pages por Auto Route