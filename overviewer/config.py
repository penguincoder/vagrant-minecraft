outputdir = "/map"
rendermode = "smooth_lighting"
world_name = "House Server"
worlds[world_name] = "/data/world"
renders["North"] = {
	'world': world_name,
	'title': 'North',
	'dimension': "overworld",
	'rendermode': rendermode,
	'northdirection': 'upper-left'
}
renders["East"] = {
	'world': world_name,
	'title': 'East',
	'dimension': "overworld",
	'rendermode': rendermode,
	'northdirection': 'upper-right'
}
renders["South"] = {
	'world': world_name,
	'title': 'South',
	'dimension': "overworld",
	'rendermode': rendermode,
	'northdirection': 'lower-right'
}
renders["West"] = {
	'world': world_name,
	'title': 'West',
	'dimension': "overworld",
	'rendermode': rendermode,
	'northdirection': 'lower-left'
}
renders["Nether-North"] = {
	'world': world_name,
	'title': 'Nether-North',
	'dimension': 'nether',
	'rendermode': 'nether_smooth_lighting',
	'northdirection': 'upper-left'
}
renders["Nether-South"] = {
	'world': world_name,
	'title': 'Nether-South',
	'dimension': 'nether',
	'rendermode': 'nether_smooth_lighting',
	'northdirection': 'lower-right'
}
renders["End-North"] = {
	'world': world_name,
	'title': 'End-North',
	'dimension': 'end',
	'rendermode': 'smooth_lighting',
	'northdirection': 'upper-left'
}
renders["End-South"] = {
	'world': world_name,
	'title': 'End-South',
	'dimension': 'end',
	'rendermode': 'smooth_lighting',
	'northdirection': 'lower-right'
}
renders["Caves-North"] = {
	'world': world_name,
	'title': 'Caves-North',
	'dimension': "overworld",
	'rendermode': 'cave',
	'northdirection': 'upper-left'
}
renders["Caves-South"] = {
	'world': world_name,
	'title': 'Caves-South',
	'dimension': "overworld",
	'rendermode': 'cave',
	'northdirection': 'lower-right'
}
