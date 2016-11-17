Post.destroy_all
User.destroy_all

post1 = Post.create!(name: "Diana B. Gobar", photo_url: "https://pbs.twimg.com/profile_images/793280191015641088/axS7aP7j.jpg", description: "web dev need halp with resume", resume: "put google docs link here")
post2 = Post.create!(name: "John Doe", photo_url: "http://alcarazweb.com/images/Jhon-Doe.jpg", description: "also needs halps..", resume: "put google docs link here")
post3 = Post.create!(name: "Nancy Drew", photo_url: "http://www.projectcasting.com/wp-content/uploads/2015/10/Movie-review-Nancy-Drew.jpg", description: "Selfmade Detective. Really awesome and finding things. Please help me update my resume", resume: "put google doc link here")
