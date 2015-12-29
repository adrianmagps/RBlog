# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "subscriber", description: "Can read items"})
Role.create({name: "reviewer", description: "Can read and create post"})
Role.create({name: "editor", description: "Can read and create post. Can update and destroy own posts. Can publish post"})
r4 = Role.create({name: "admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "adrian", email: "adrian@example.com", password: "Panatinaikos09", password_confirmation: "Panatinaikos09", role_id: r1.id})
u2 = User.create({name: "admin", email: "admin@example.com", password: "Panatinaikos09", password_confirmation: "Panatinaikos09", role_id: r4.id})

cat = Category.create([{name: 'Juego'}])
Category.create([{name: 'Tecnologia'}])
Category.create([{name: 'Musica'}])


t = Tag.create([{name: 'pc'},{name: 'xbox'},{name: 'CoD'}])
t1 = Tag.create([{name: 'rock'},{name: 'pop'},{name: 'metalica'}])

ent = Post.create([{
    title: 'First Blog',
    content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!',
    summary: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ips...',
    visible: true,
    user_id: u2.id,
    tags: t1
  },{
    title: 'Second Blog',
    content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!',
    summary: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ips...',
    visible: true,
    user_id: u2.id,
    tags: t
},{
    title: 'Final Blog',
    content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ipsam distinctio minima dolorum perferendis labore impedit voluptates!',
    summary: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi, fugiat, asperiores harum voluptatum tenetur a possimus nesciunt quod accusamus saepe tempora ips...',
    visible: false,
    user_id: u2.id,
    categories: cat,
    tags: t
}])

Comment.create(name: 'Adrian', email:'adrianmagps@gmail.com', visible: true, body: 'Este es mi primer comentario del dia', post: ent.first)
Comment.create(name: 'Ive', email:'ivetsy@gmail.com', visible: true, body: 'Este es mi primer comentario', post: ent.first)
Comment.create(name: 'Adrian', email:'adrianmagps@gmail.com', visible: true, body: 'Este es mi segundo comentario del dia', post: ent.first)