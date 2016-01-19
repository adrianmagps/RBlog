# RBlog #

Es una aplicación web para la creación y administración de articulos. Su interfaz esta diseñada en el Framework [Bootstrap CSS](http://getbootstrap.com) y enriquecida con la libreria React

## Contenido ##
- Entidades
- Tecnologias
- Base de Datos
- Dependencias
- Servicios

## Entidades: ##
* Categorias
* Etiquetas
* Artículos
* Usuarios

## Tecnologias: ##
* Ruby 2.1.0
* Rails 4.2 (Framework Web)
* PostgreSQL (Gestor DB)
* jQuery (Manipulacion del DOM, request ajax, etc)
* ReactJS (Framework JS)
* Bootstrap CSS

## Base de Datos: ##

>**NOTA:** Crear en el gestor de base de datos un usuario llamado **rblog** con la contraseña ****** (que decidan), lo que en caso de que pongan
una contraseña distinta a la que esta en el fichero **database.yml** modificar el mismo

Ejecutar en el terminal

1. `rake db:drop` (si existe la base de datos)
2. `rake db:create`
3. `rake db:migrate`
4. `rake db:seed`

Luego pueden entrar al sistema con la combinacion usuario/pass **admin@example.com/Panatinakos09**

## Dependencias (Gems): ##
* devise
* cancancan
* react-rails
* tinymce-rails
* bootstrap-sass

## Servicios: ##

* Feeds (ATOM)

