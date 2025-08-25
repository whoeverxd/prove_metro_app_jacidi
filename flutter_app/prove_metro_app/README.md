# Jacidi MobileApp
Hola y bienvenido a esta prueba técnica para jacidi. En el siguiente documento te explicaremos qué tipo de perfil buscamos, instrucciones de la prueba, objetivos de la prueba y los criterios de evaluación de la misma.

## Que buscamos
Esta es una prueba para desarrolladores flutter senior, no se trata tanto de hacerla bien o mal, sino de determinar qué nivel como desarrollador MobileApp Flutter tienes.

## Instrucciones de la prueba
En el siguiente proyecto Flutter, tienes un esqueleto básico de una mobile app. Para simular una API con la información a mostrar, está también incluido el directorio resources que contiene imágenes de archivo que puedes utilizar y una simulación de las respuestas de la api con los datos que deberás mostrar por pantalla. tal que:
- list_activities.json: Contiene en un json la información sobre las actividades del gimnasio y los vínculos a entrenadores y socios inscritos.
- list_members.json: Contiene en un json la información de los miembros del gimnasio.
- list_trainers.json: Contiene en un json la información de los entrenadores del gimnasio y la referencia a las clases que tienen asignados cada uno de ellos.

De igual modo, si tienes dudas sobre el look and field a aplicar, toma como referencia la actual web del gimnasio (esto es solo una prueba, no se trata de hacer un 1:1 respecto de la web): https://clubmetropolitan.com/

## Objetivos de la prueba
El objetivo de la prueba es desarrollar una mobile app con Flutter para que un usuario de un gimnasio pueda gestionar sus actividades. Dicha app tendrá dos grandes secciones actividades del usuario y vista de actividades.

No es necesario que diseñes un sistema de login, por ello tienes un único usuario en el list_members.json, asume que ese es el usuario con el que estás logado

### Actividades del usuario
Tendrás que poder ver la lista de las actividades que el usuario está inscrito, mostrando el nombre de la actividad, el día y la hora de la misma. Al seleccionar una actividad, se debe mostrar una vista con la información al detalle y la opción de cancelar la inscripción.
Resumiendo los puntos de esta sección:
* Información de lista de las actividades del usuario: nombre de actividad, dia, hora.
* Información del detalle de una actividad: Nombre de actividad, dia, hora, texto descriptivo de la actividad, fotos, nombre y apellidos del entrenador responsable y la opción de cancelar.
* Cancelación de actividad: Elimina la inscripción a una actividad del usuario y borra la actividad de la lista del usuario.
* La distribución y organización de la información a mostrar, queda a tu libre disposición, determnalo tú mismo el modo que consideres más adecuado.
* La forma de transicionar de la lista, al detalle, también queda a tu elección (desplegable, pop-up, transición a pestaña oculta, etc)

### Vista de actividades
Tendrás que listar todas las actividades dirigidas que ofrece el gimnasio, con una información escueta de la misma. No obstante, al seleccionar una clase, se tiene que poder ver la información en detalle de la clase.
* Información en la lista: Nombre de la clase, dia y hora de la clase
* Información del detalle de la clase: Nombre de la clase, día, hora, descripción de la clase, fotos ilustrativas, nombre y apellidos del entrenador responsable de la clase y la opción de inscribirse a ella.
* La distribución y organización de la información a mostrar, queda a tu libre disposición, determnalo tú mismo el modo que consideres más adecuado.
* La forma de transicionar de la lista, al detalle, también queda a tu elección (desplegable, pop-up, transición a pestaña oculta, etc)
* La inscripción a una actividad deberá ser única, por lo que si ya está inscrito a las actividad, el usuario deberá ver la opción de cancelar, no la inscribirse. De igual modo, no se puede inscribir a distintas clases que coincidan en día y hora, en ese caso, las actividades coincidentes deberán tener la inscripción desactivada, hasta que se cancele la actividad coincidente. Dicho cambio debe ser consistente y verse reflejado en la vista de actividades del usuario (si, una caché local con el cambio es suficiente, no tienes que simular una persistencia duradera)

## Criterios de evaluación
Se esperan las funcionalidades:
* Listado de actividades del usuario
* Detalle de actividades
* Listado de actividades del gimnasio
* Inscripción y cancelación de actividades del usuario

Ten en cuenta que esta prueba no se trata solo de cumplir todos los puntos, sino de evaluar tu talento como programador, buscamos a profesionales con inventiva y capacidad para buscar soluciones, no tanto dominar tal o cual tecnología. Por ello, aspectos como los patrones de diseño, la calidad del código, la cobertura en test, la documentación y la buena metodología para organizar el trabajo, son aspectos que valoramos tanto o más que cumplir con la checklist de objetivos de la prueba. No obstante, si decides ir más allá, implementar más funcionalidades o cambios en el diseño que consideres una mejora, no te cortes y hazlo, te animamos a que te luzcas y muestres lo que sabes hacer.

## Candidate notes
Cualquier instrucción sobre la ejecución o cambio que consideres relevante, indicalo aquí abajo. Eres libre de usar cualquier herramienta o recurso y cambiar lo que consideres mejor, pero comentanos el que y el por que.