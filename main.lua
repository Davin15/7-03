-----------------------------------------------------------------------------------------
--
-- main.lua
--ByDavin Rousseau
-- created on apr.17th/2019
-- program allows character to move based on touch events and Gravity/Physics
-----------------------------------------------------------------------------------------
display.setDefault("background", 0, 1, 2)
-- Character move

local dPad = display.newImageRect( "assets/d-pad.png", 100, 80 )
dPad.x = 120
dPad.y = 280
dPad.id = "d-pad"

local upArrow = display.newImageRect( "assets/upArrow.png", 30, 20 )
upArrow.x = 120
upArrow.y = 250
upArrow.id = "up arrow"

local downArrow = display.newImageRect( "assets/downArrow.png", 30, 20 )
downArrow.x = 120
downArrow.y = 310
downArrow.id = "down arrow"

local leftArrow = display.newImageRect( "assets/leftArrow.png", 30, 20 )
leftArrow.x = 92
leftArrow.y = 280
leftArrow.id = "left arrow"

local rightArrow = display.newImageRect( "assets/rightArrow.png", 30, 20 )
rightArrow.x = 462
rightArrow.y = 280
rightArrow.id = "right arrow"

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )


local theCharacter = display.newImageRect( "assets/character.png", 80, 100 )
theCharacter.x = 150
theCharacter.y = 180
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )


local theGround = display.newImageRect( "assets/land.png", 100, 125 )
theGround.x = display.contentCenterX 
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )
 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = -50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

upArrow:addEventListener( "touch", upArrow )

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = 50, -- move down 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

downArrow:addEventListener( "touch", downArrow )

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = -50, -- move 50 pixels in the x direction "left" 
        	y = 0, -- move 0 pixels in y direction
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

leftArrow:addEventListener( "touch", leftArrow )

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 50, -- move 50 pixels in the x direction "right" 
        	y = 0, -- move 0 pixels in y direction
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

rightArrow:addEventListener( "touch", rightArrow )