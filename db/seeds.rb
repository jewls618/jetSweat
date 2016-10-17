# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

http://www.chcp.edu/sites/default/files/content/images/CHCP-Austin-Campus_0.jpg

austin = Location.create(city: "Austin", photo: "http://www.meekrealty.net/wp-content/uploads/2012/08/Austin-downtown.jpg")
boston = Location.create(city: "Boston", photo: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ94nnvhgph4syJ7FqRQow0MVw-dLt4MeJwjzG0X1DaNgchlghf")
chicago = Location.create(city: "Chicago", photo: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSlInbaOueLevf3MhUJDGaI05i8KuMWQ3u6sbDQQ_b7_57NZbxXhw")
denver = Location.create(city: "Denver", photo: "https://lonelyplanetimages.imgix.net/a/g/hi/t/1da32e09c1497a907cda4479049e6b2b-denver.jpg?sharp=10&vib=20&w=1200")
houston = Location.create(city: "Houston", photo: "http://professionalcaretakers.com/wp-content/uploads/2014/09/HoustonSkyline.jpg")
lost_angeles = Location.create(city: "Los Angeles", photo: "http://eskipaper.com/images/la-skyline-3.jpg")
miami = Location.create(city: "Miami", photo: "http://foodtruckempire.com/wp-content/uploads/mia.jpg")
new_orleans = Location.create(city: "New Orleans", photo: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSxKUQIBtRv3C-O0CATvAYlwhA6IFWVCmgLTneebD8JKXOWQQs2")
new_york = Location.create(city: "New York", photo: "https://s-media-cache-ak0.pinimg.com/originals/39/60/b6/3960b613c265776676276d276e286a1c.jpg")
san_francisco = Location.create(city: "San Francisco", photo: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRckHfTcVip4c1RW3EL2sfi-OY8ekDdFARM1wIWcE6VHM645KXE" )
seattle = Location.create(city: "Seattle", photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTpwTsUG09iGtbM52OBucVju0zAQsR--dIQmJimUFPtSg0zVg-Y")
washington_dc = Location.create(city: "Washington, D.C.", photo: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ3r_zZTJLzZTgXHjH1_otLIQFEhy_1eB4SLlfZG4mq3SHAphPa")

classes = Category.create(category: "Class", photo: "http://96bda424cfcc34d9dd1a-0a7f10f87519dba22d2dbc6233a731e5.r41.cf2.rackcdn.com/simplybarre/barre_blog_copy.jpg")
crossfit = Category.create(category: "Crossfit", photo: "https://prod-academy-wp-content-uploads.s3.amazonaws.com/2015/12/onnitacademywod4.jpg")
gym = Category.create(category: "Gym", photo: "http://luxurylaunches.com/wp-content/uploads/2014/09/peninsula-shanghai-gym.jpg")
hike = Category.create(category: "Hike", photo: "https://partners.novascotia.com/sites/default/files/CBHNP%20Skyline%20Sunset%20Hike.jpg")
rock_climbing = Category.create(category: "Rock Climbing", photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ6YxChOQt04SRPtb00EFDSG3YP0IgmzYKEaHksqCQK2PFRi29D")
run = Category.create(category: "Run", photo: "http://discover.sap.com/content/dam/digitalhub/desktopimages/Best-run-city_276360_h_ergb_s_gl_1920x1280.jpg")
sports = Category.create(category: "Sports", photo: "https://static1.squarespace.com/static/563032b9e4b0465682348ce1/t/56cccd8cc6fc08356f9df8fc/1456262575475/")
swim = Category.create(category: "Swim", photo: "https://www.teamunify.com/amsasc/_images/cust_bg_3643_1440216355832.jpg")
