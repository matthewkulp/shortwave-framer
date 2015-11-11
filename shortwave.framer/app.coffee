# Framer.Device.background.backgroundColor = "purple"
Framer.Device.background.backgroundColor = "#CFCFF5"

module = require "colourTransition"



sketch = Framer.Importer.load "imported/2015.10"



Framer.Device.phone.image = ""



ok = sketch.O_K
bulb = sketch.bulb
chickenLeg = sketch.chickenLeg
shades = sketch.shades
cherry = sketch.cherry
reticle = sketch.reticle
colorHandleRight = sketch.colorRight
colorHandleLeft = sketch.colorLeft
socks = sketch.socks
pickText = sketch.pick
tree = sketch.tree
icons = sketch.icons

dummyBG = sketch.dummyBG
dummyBG.opacity = 0

colorHandleLeft.opacity = 0
colorHandleRight.opacity = 0
colorHandleLeft.scale = .8
colorHandleRight.scale = .8

activeScale = 1
almostActiveScale = .65
notActiveScale = .2

activeOpacity = 1
almostActiveOpacity = .4
notActiveOpacity = 0

reticle.opacity = almostActiveOpacity

cherry.opacity = almostActiveOpacity
cherry.scale = almostActiveScale
chickenLeg.opacity = almostActiveOpacity
chickenLeg.scale = almostActiveScale

tree.opacity = notActiveOpacity
tree.scale = notActiveScale
socks.opacity = notActiveOpacity
socks.scale = notActiveScale
sketch.placeholderLeft.opacity = 0
sketch.placeholderRight.opacity = 0

handleCurve = 'spring(180, 15, 6)'

i = 3
iconArray = [tree, socks, chickenLeg, bulb, cherry]
activeIcon = iconArray[i]

iconSpacing = 270
icons.y = -iconSpacing

red = 'rgba(255, 80, 80, 1)'
purple = 'rgba(165, 80, 243, 1)'
blue = 'rgba(71, 147, 231, 1)'
green = 'rgba(2, 194, 99, 1)'
yellow = 'rgba(232, 173, 39, 1)' 
orange = 'rgba(241, 121, 58, 1)'
colorsArray = [red, purple, blue, green, yellow, orange]
j = 0

iconScreenBG = new Layer
	width: 750
	height: 1334
	backgroundColor: colorsArray[j]
	superLayer: sketch.iconBG

leftHandle = new Layer
	superLayer: sketch.colorLeft
	backgroundColor: colorsArray[j+1]
	width: 46
	height: 46
	borderRadius: 23
	borderColor: 'white'
	borderWidth: 8
	shadowColor: 'rgba(0, 0, 0, .1)' 
	shadowBlur: 4
	

rightHandle = new Layer
	superLayer: sketch.colorRight
	backgroundColor: colorsArray[colorsArray.length - 1]
	width: 46
	height: 46
	borderRadius: 23
	borderColor: 'white'
	borderWidth: 8
	shadowColor: 'rgba(0, 0, 0, .1)' 
	shadowBlur: 4

leftHandle.center()
rightHandle.center()

iconSelectionUI = sketch.iconSelectionUI

helloGif = new VideoLayer
	video: "http://media.giphy.com/media/rQn119cCThAjK/giphy.mp4"
	width: 516
	height: 390
	backgroundColor: null
	superLayer: sketch.bubbleGIF
	

helloGif.player.autoplay = true
helloGif.player.on 'ended', ->
	helloGif.player.play()


# outOfRangeScreen = sketch.outOfRangeScreen

messageBulb = sketch.messageBulb
messageChickenLeg = sketch.messageChickenLeg
messageUser = sketch.messageUser

messageBulb.opacity = 0 
messageChickenLeg.opacity = 0 
messageUser.opacity = 0
compose = sketch.compose
composeStartY = compose.y
composeClosedY = compose.y + sketch.Keyboard.height
compose.y = composeClosedY

messages = sketch.messages
messages.y = 552

cord = sketch.cord
typeAMessage = sketch.typeAmessage
y = sketch.y
o = sketch.o
blinking = sketch.blinking
blinkingStartX = blinking.x
y.opacity = 0
o.opacity = 0
blinking.opacity = 0
ok2 = sketch.O_K2
okOutline2 = sketch.okOutline2
okOutline2.opacity = almostActiveOpacity
errorText = sketch.errorText
chat = sketch.chat
# errorText.opacity = 0
ok2.opacity = 0
nearbyBG = sketch.nearbyBG
cordStartX = cord.x
nearbyNumber = sketch.nearbyNumber
nearbyNumber.opacity = 0
nearbyNumberStartY = nearbyNumber.y
nearbyNumber.y += 18
warning = sketch.warning
warning.opacity = 0
outOfRangeScreen = sketch.outOfRange
outOfRangeScreen.opacity = 0
warningCircle = sketch.warningCircle
warningYield = sketch.warningYield

selectedIcon = iconArray[i]
selectedIconTranslateTime = .6

okLetters = sketch.okLetters

reticle.opacity = 0
icons.opacity = 0
ok.opacity = 0
pickText.opacity = 0
iconSelection = sketch.iconSelection
okOutline = sketch.okOutline
okOutline.opacity = almostActiveOpacity

handleLeftEndX = colorHandleLeft.x
handleLeftStartX = colorHandleLeft.x + 24
colorHandleLeft.x = handleLeftStartX

handleRightEndX = colorHandleRight.x
handleRightStartX = colorHandleRight.x - 24
colorHandleRight.x = handleRightStartX

okLetters2 = sketch.okLetters2
okLetters2.rotation = -25
okLetters.rotation = -25
pickTextY = pickText.y
pickText.y += 18
colorHandleLeft.scale = .1
colorHandleRight.scale = .1


# create canvas
canvas = new Layer
	width: 750,
	height: 1334,
	backgroundColor: "none"
canvas.center()

canvas.html = "<svg id='svg' style='width:#{canvas.width}px;height:#{canvas.height}px;ignore-events:all;'></svg>"

snap = Snap(canvas.querySelector("#svg"))

object = snap.path("M375,612.000027 C375,612.000027 329.554689,-111.785154 663.0000,106")

pathLength = object.getTotalLength()

object.attr
	fill: "none"
# 	stroke: "rgba(255, 0, 0, 1)"
	strokeWidth: "16px"
	strokeLinejoin: "round"
	strokeLinecap: "round"
	strokeDasharray: pathLength + ' ' + pathLength
	strokeDashoffset: pathLength # set offset to pathlength makes the path invisible

# create a new reference layer that is at the same position as canvas
layerAtCanvas = new Layer
	x: canvas.x
	y: canvas.y
	backgroundColor: null
	clip: false # so we can have all objects inside this layer be visible

# set up helper that will help us better tweak the animation along the curve. We'll connect it's movement to the curve
redBox = new Layer 
	width: 10 
	height: 10
	backgroundColor: null

# Define how far the box will move left and right
redBox.states.add
	full: 
		x: 100
	
redBox.states.animationOptions = 
	curve: "ease-out"
	time: selectedIconTranslateTime

# change SVG when red box moves
redBox.on "change:x", (e) ->
		
	# offset dash in path from pathlength to 0
	object.attr { strokeDashoffset: Utils.modulate(e, [0,100], [pathLength,0], true) }
	
	# find point on path along
	pointOnPath = object.getPointAtLength ( Utils.modulate(e, [0,100], [0,pathLength], true) )
	# position circle at that point
	selectedIcon.superLayer = layerAtCanvas
	selectedIcon.midX = pointOnPath.x
	selectedIcon.midY = pointOnPath.y


plug = sketch.plug
hole = sketch.hole
holeMask = sketch.holeMask
plugEndX = plug.x
plugEndY = plug.y

plugStartX = plugEndX - 474
plugStartY = plugEndY + 276
plug.x = plugStartX
plug.y = plugStartY

outOfRangeText = sketch.outOfRangeText
frownFace = sketch.frownface
outOfRangeText.y += 24
outOfRangeTextEndY = outOfRangeText.y
frownFace.props =
	opacity: 0
	scale: .5
	rotation: 90

outOfRangeText.opacity = 0
statusBar = sketch.Status_Bar_White
cord.opacity = 0
lady = sketch.lady
lady.opacity = almostActiveOpacity

compose.y = 1336
compose.opacity = 0



touchCircle = new Layer
	width: 30
	height: 30
	borderRadius: 30
	backgroundColor: 'lightgray'
	opacity: 0
	
circleExpand = new Animation
	layer: touchCircle
	properties: 
		scale: 6
		opacity: 0
	curve: 'ease-out'
	time: .25

touch = (xPos, yPos) ->
	touchCircle.x = xPos
	touchCircle.y = yPos
	touchCircle.opacity = 1
	circleExpand.start()
	circleExpand.on "end", ->
		touchCircle.scale = 1

swipeDisplaceX = 140
swipeDisplaceY = 180














# Spin that reticle!
reticle.animate
	properties: 
		rotation: 360
	time: 90

send = sketch.sendButton
send.opacity = 0
send.saturate = 0





iconEntrance = ->
	h = 0
	for icon in iconArray
		do (icon) ->
			iconEndY = icon.y
			iconAnticipationY = icon.y + 10
			anticipationAnimation = new Animation
				layer: icon
				properties:
					y: iconAnticipationY
				time: .1
				delay: .05 * h
			anticipationAnimation.start()
			anticipationAnimation.on 'end', ->
				icon.animate 
					properties:
						y: iconEndY
					curve: 'spring(200,14,0)'
			h++	



changeColor = ->
	handleStart = colorHandleLeft.x
	
	displaceHandle = new Animation
		layer: colorHandleLeft 
		properties:
			x: handleStart + 18
		time: .09
		curve: 'ease-out'
	
	displaceHandle.start()
	
	displaceHandle.on 'end', ->
		colorHandleLeft.animate
			properties:
				x: handleStart
			curve: 'spring(100, 12, 8)'
	
	j++
	beforeColor = colorsArray[j-1]
	activeColor = colorsArray[j]
	afterColor = colorsArray[j+1]
	
	do (activeColor, beforeColor, afterColor) ->
		module.colourTransition(rightHandle, beforeColor, .1, 30)
		module.colourTransition(iconScreenBG, activeColor, .1, 30)
		module.colourTransition(leftHandle, afterColor, .1, 30)



changeIcon = ->
	i--
	activeIcon = iconArray[i]


#	Animate entire array to new position
	icons.animate 
		properties:
			y: icons.y + 270
		time: .2
		curve: 'ease-in-out'

#	Animate the active icon
	activeIcon.animate
		properties: 
			scale: activeScale
			opacity: activeOpacity
		time: .2


# 	Animate the almost Active icons	
	beforeIcon = iconArray[i + 1]
	afterIcon = iconArray[i - 1]
			
	beforeIcon.animate
		properties: 
			opacity: almostActiveOpacity
			scale: almostActiveScale
		time: .2
	
	afterIcon.animate
		properties:
			opacity: almostActiveOpacity
			scale: almostActiveScale
		time: .2


# 	Animate the not Active icons	
	beforeBeforeIcon = iconArray[i + 2]
	afterAfterIcon = iconArray[i + 2]
	
	beforeBeforeIcon.animate
		properties: 
			opacity: notActiveOpacity
			scale: notActiveScale
		time: .2
		
	afterAfterIcon.animate
		properties:
			opacity: notActiveOpacity
			scale: notActiveScale
		time: .2





iconSelectionEnters = ->
	# First Screen Enters
	pickText.animate
		properties: 
			opacity: 1
			y: pickTextY
		time: .2

	Utils.delay .1, ->
	
		# Reticle Enters
		reticle.animate
			properties: 
				opacity: 1
			time: .6

		iconEntrance()		
			
			
		Utils.delay .1, ->
			# Force an impactful entrance with an icon change
			changeIcon()
			
			# Icons fade in
			icons.animate
				properties: 
					opacity: 1
				time: .5


		Utils.delay .1, ->
			# Handles enter impactfully
			colorHandleLeft.animate
				properties:
					opacity: 1
					scale: 1
					x: handleLeftEndX
				curve: handleCurve
				
			colorHandleRight.animate
				properties: 
					opacity: 1
					scale: 1
					x: handleRightEndX
				curve: handleCurve
		

		Utils.delay .2, ->
			okLetters.animate
				properties: 
					rotation: 0
				curve: 'spring'
				
			ok.animate
				properties: 
					opacity: 1
				time: .5
				



iconSelected = ->
	Utils.delay .2, ->
		iconSelectionUI.opacity = 0
		iconScreenBG.superLayer = nearbyBG
		selectedIcon = iconArray[i]
		
		
		redBox.states.next()
		redBox.on 'end', ->
			selectedIcon.superLayer = nearbyBG
			
			nearbyNumber.animate
				properties:
					opacity: 1
					y: nearbyNumberStartY
				time: .2
				delay: .3
		
		
		iconScreenBG.animate
			properties: 
				height: 190
			time: selectedIconTranslateTime
		
		
		selectedIcon.animate
			properties:
				rotation: 360
				scale: .43
			curve: 'ease-in-out'
			time: selectedIconTranslateTime
			
		compose.animate
			properties:
				y: composeClosedY
				opacity: 1
			time: .4
			curve: 'ease-out'
	
				

bulbMessages = ->	
	# First Message
	messageBulb.animate
		properties: 
			opacity: 1
			y: messageBulb.y - 24
		time: .3
	

	
		
chickenMessages = ->
	# Second Message
	messages.animate
		properties:
			y: messages.y - 168
		time: .3
		
	messageChickenLeg.animate
		properties: 
			opacity: 1
		time: .3
		
		

				
writeMessage = ->
# Third Message (Compose Message)
	Utils.delay .2, ->
		# Keyboard comes up
		compose.animate
			properties: 
				y: composeStartY
			time: .4
			
		messages.animate
			properties:
				y: messages.y - 432
			time: .4
	
	
		# Cursor blinking and moving
		visibility = 1
		
		blinkOn = ->
			blinkingCursor = blinking.animate
				properties: 
					opacity: 1 * visibility
				time: .1
		
			blinkingCursor.on 'end', ->
				blinkOff()
			
		blinkOff = ->
			visibility *= -1
			Utils.delay .4, ->
				blinkOn()
				
		blinkOn()
	
	
		# 'Type a message...' disappears
		typeAMessage.animate
			properties:
				opacity: 0
			time: .2
		
		send.animate
			properties:
				opacity: 1
			time: .2
	
		Utils.delay .5, ->
			# Typing 'y'
			touch(375, 936)
			y.opacity = 1
			send.saturate = 100
			
			# Move cursor 1
			blinking.x = blinking.x + 25

			
			Utils.delay .25, ->
				# Typing 'o'
				touch(609, 913)
				o.opacity = 1
				
				# Move cursor 2
				blinking.x = blinking.x + 20




sendMessage = ->
	# Clear letters & reset cursor
	y.opacity = 0
	o.opacity = 0
	blinking.x = blinkingStartX
	send.saturate = 0
	
	
	# Third message enters chat
	messages.animate 
		properties:
			y: messages.y - 168
		time: .4

	messageUser.animate
		properties: 
			opacity: 1
			y: messageUser.y - 24
		time: .4




# Utils.delay .6, ->
errorMessage = ->
	# Error message appears, alert								
	# Hide the blinking cursor
	blinking.x = -20
	
	send.animate
		properties: 
			opacity: 0
		time: .2
	
	warning.animate
		properties:
			opacity: 1
		time: .6
	
	
	# Messages and nearby gray out
	messages.animate
		properties: 
			opacity: .4
		time: .2
	
	nearbyNumber.animate
		properties: 
			opacity: almostActiveOpacity
		time: .2
		
	
	# Keyboard minimizes
	compose.animate
		properties: 
			y: composeClosedY + 110
		time: .4
		delay: .2
				
# Error / Alert symbol is touched
openError = ->
	Utils.delay .2, ->
		statusBar.animate
			properties:
				opacity: 0
			time: .05
			
		warningYield.animate 
			properties:
				opacity: 0
			time: .05
		
		buttonExpands = warningCircle.animate
			properties: 
				scale: 16
			time: .15
			curve: 'ease-in'
		
	
		buttonExpands.on 'end', ->
			outOfRangeScreen.bringToFront()
			outOfRangeScreen.opacity = 1
			
			# Plug enters
			cord.animate
				properties: 
					opacity: 1
				time: .6
			
			# Plug moves into the plug
			plug.animate
				properties:
					x: plugEndX
					y: plugEndY
				time: .2
				curve: 'ease-in-out'
				delay: .3
			
			
			# Set up the shaking motion for the plug
			direction = 1
			k = 1
			
			shakeNoConnection = ->
				if (k < 7)
					shake = cord.animate
						properties:
							x: (cordStartX + 12 * direction) - 12
						time: .05
					
					shake.on 'end', ->
						shakeNoConnectionReverse()
						k++
			
			
			shakeNoConnectionReverse = ->
				direction *= -1
				shakeNoConnection()
		
		
			Utils.delay .7, ->
				# Plug shaking
				shakeNoConnection()
		
				# Plug rejected, exits hole
				plug.animate
					properties: 
						x: plugStartX
						y: plugStartY
					time: .4
					delay: .5
				
				# Plug and hole dim
				cord.animate
					properties:
						opacity: almostActiveOpacity
					time: .3
					delay: 1
			
				# Message appears, text and frown
				outOfRangeText.animate
					properties: 
						opacity: 1
						y: outOfRangeTextEndY
					time: .3
					delay: 1
				
				frownFace.animate
					properties:
						opacity: 1
						scale: 1
						rotation: 0
					curve: 'spring(200,16,10)'
					delay: 1
				
				# OK button appears
				ok2.animate
					properties:
						opacity: 1
					time: .8
					delay: 1
					
				okLetters2.animate
					properties:
						rotation: 0
					curve: 'spring'
					delay: 1
											











# Story Controller
Utils.delay .1, ->
	iconSelectionEnters()
	
	
	Utils.delay 1.1, ->
		changeColor()
		
		touch(40, 700)
		touchCircle.animate
			properties: 
				x: touchCircle.x + swipeDisplaceX
			time: .1
		
	
		Utils.delay .3, ->
			changeColor()
			
			touch(30, 730)
			touchCircle.animate
				properties: 
					x: touchCircle.x + swipeDisplaceX
				time: .1
		
		
				Utils.delay .6, ->
					changeIcon()
					
					touch(510, 690)
					touchCircle.animate
						properties: 
							y: touchCircle.y + swipeDisplaceY
						time: .1
					
					
					Utils.delay .6, ->
						iconSelected()
						
						touch(400, 1222)
						
						
						Utils.delay 1.4, ->
							bulbMessages()
							
							
							Utils.delay .7, ->
								chickenMessages()
								
								Utils.delay .9, ->
									writeMessage()
									
									touch(261,1122)
									
									
									Utils.delay 1.5, ->
										sendMessage()
										
										touch(594, 704)
										
										
										Utils.delay 1.2, ->
											errorMessage()
											
											
											Utils.delay 1.6, ->
												openError()
												
												touch(330, 1132)
