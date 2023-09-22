extends ItemScript

func logic():
	Game.current_player.health.heal(10)
