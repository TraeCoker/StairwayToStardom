# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
musicians = Musician.create([{ name: 'Bruce Springsteen', instrument: 0,}, {name: 'Neil Pert', instrument: 1}, {name: 'Jimmy Page', instrument: 2}, {name: 'Victor Wooten', instrument: 3}])
venues = Venue.create([{ name: "Lil Bistra's Music Market", location: 'Boulder, CO', tier: 1,  description: 'Ecclectic record store in Boulder, Colorado. Featuring live bands and records of all genres.' },
                       { name: "Red Rocks Ampitheater", location: 'Morrison, CO', tier: 3,  description: 'Red Rocks Amphitheatre is an open-air amphitheatre built into a rock structure in the western United States, near Morrison, Colorado, ten miles (16 km) west of Denver. There is a large, tilted, disc-shaped rock behind the stage, a huge vertical rock angled outwards from stage right, several large outcrops angled outwards from stage left and a seating area for up to 9,525.' }])