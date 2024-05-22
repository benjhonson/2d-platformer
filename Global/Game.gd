extends Node


var playerHP = 20
var Gold  = 0
var jump_max = 1
var pigHP = 100



var Items = {
	0: {
		"Name": "2X JUMP",
		"Desc": "Allows you to jump twice",
		"Cost": 50,
	},
	1: {
		"Name": "Full Health & Shield",
		"Desc": "Instantly heals you and gives you full shield",
		"Cost": 100,
	},
	2: {
		"Name": "In progress1",
		"Desc": "In progress1",
		"Cost": 10,
	},
}

var Inventory = {
	0:{
		"Name": "In progress0",
		"Desc": "In progress0",
		"Cost": 0,
		"Count": 1,
		
	},
	1:{
		"Name": "2X JUMP",
		"Desc": "Allows you to jump twice",
		"Cost": 10,
		"Count": 1,
	},
}
