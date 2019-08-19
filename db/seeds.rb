# FIRST SEED
# #tropes
# the_dragon = Trope.find_or_create_by(name: "The Dragon")
# the_big_bad = Trope.find_or_create_by(name: "The Big Bad")
# mac_guffin = Trope.find_or_create_by(name: "Mac Guffin")
# # mac_guffin.name='Mac Guffin'
#
#
# #works
# the_empire_strikes_back = ArtisticWork.find_or_create_by(name: "The Empire Strikes Back", release_year: 1980)
# total_recall = ArtisticWork.find_or_create_by(name: "Total Recall", release_year: 1990)
# escape_from_new_york = ArtisticWork.find_or_create_by(name: "Escape From New York", release_year: 1981)
# pulp_fiction = ArtisticWork.find_or_create_by(name: "Pulp Fiction")
#
# #associations
# the_empire_strikes_back.tropes << the_dragon
# the_empire_strikes_back.tropes << the_big_bad
# total_recall.tropes << the_dragon
# total_recall.tropes << the_big_bad
# escape_from_new_york.tropes << the_dragon
# escape_from_new_york.tropes << the_big_bad
# escape_from_new_york.tropes << mac_guffin
# pulp_fiction.tropes << the_big_bad
# pulp_fiction.tropes << mac_guffin
