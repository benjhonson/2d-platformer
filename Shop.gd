extends CanvasLayer

var vendor_reference
var currItem = 0
var select = 0
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	vendor_reference = get_node("..")
	if Game.jump_max >= 2 and Game.Inventory[1]["Name"] == Game.Items[currItem]["Name"]:
		get_node("Control/buy").visible = false
	else:
		get_node("Control/buy").visible = true
	get_node("Control/AnimatedSprite2D").play("2X JUMP")
		
func switchitem(select):
	if select == 3:
		select = 0
	elif select == -1:
		select = 2
	currItem = select
	get_node("Control/AnimatedSprite2D").play(Game.Items[currItem]["Name"])
	get_node("Control/Name").text = Game.Items[currItem]["Name"]
	get_node("Control/Desc").text = Game.Items[currItem]["Desc"]
	get_node("Control/Desc").text += "\nCost: " + str(Game.Items[currItem]["Cost"])

func _on_close_pressed():
	if vendor_reference.flagVendor == 1:
		get_node("Anim1").play("TransOut")
		get_tree().paused = false
		vendor_reference.flagVendor = 0
	
	


func _on_next_pressed():
	switchitem(currItem + 1)
	if Game.jump_max >= 2 and Game.Inventory[1]["Name"] == Game.Items[currItem]["Name"]:
		get_node("Control/buy").visible = false
	else:
		get_node("Control/buy").visible = true


func _on_prev_pressed():
	switchitem(currItem-1)
	if Game.jump_max >= 2 and Game.Inventory[1]["Name"] == Game.Items[currItem]["Name"]:
		get_node("Control/buy").visible = false
	else:
		get_node("Control/buy").visible = true


func _on_buy_pressed():
	if Game.jump_max == 1 and Game.Inventory[1]["Name"] == Game.Items[currItem]["Name"]:
		get_node("Control/buy").visible = false
	var hasItem = false
	if Game.Gold > Game.Items[currItem]["Cost"]:
		for i in Game.Inventory:
			if Game.Inventory[i]["Name"] == Game.Items[currItem]["Name"]:
				Game.Inventory[i]["Count"] +=1
				hasItem = true
		
		
		if hasItem == false:
			var tempDic = Game.Items[currItem]
			tempDic["Count"] = 1
			Game.Inventory[Game.Inventory.size()] = Game.Items[currItem]
		Game.Gold -= Game.Items[currItem]["Cost"]
	special_item()
	Utils.saveGame()
	print(Game.Inventory)
	

func special_item():
	if Game.Items[currItem]["Name"] == Game.Items[0]["Name"]:
		Game.jump_max = Game.Inventory[1]["Count"]
	elif Game.Items[currItem]["Name"] == Game.Items[1]["Name"]:
		Game.playerHP = 70
