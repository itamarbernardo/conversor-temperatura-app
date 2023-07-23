local widget = require( "widget" )
--composer
local composer = require( "composer" )
local scene = composer.newScene()


local grupoLocal = display.newGroup( )


	local conversor1 = function( event )
		composer.gotoScene("farFORcel")
	end


	local conversor2 = function( event )
		composer.gotoScene("kelvinFORcelsius")
	end

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

function scene:create( event )
    local sceneGroup = self.view

	    local w = display.contentWidth * 2
        local h = display.contentHeight * 2

        local fundoDaTela = display.newRect(grupoLocal, display.contentCenterX, display.contentCenterY, w, h)

        fundoDaTela:setFillColor(255, 255, 255)

		grupoLocal:insert(fundoDaTela)

        local titulo = display.newText( grupoLocal, "Celsius Converter", display.contentCenterX + 30, 100, 200, 150)
        titulo:setFillColor( 100, 0, 0 )

        -- Create the widget
        local button1 = widget.newButton
    {
        label = "button",
        onEvent = handleButtonEvent,
        emboss = false,

		--properties for a rounded rectangle button...
        shape="roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={ 1, 0, 0, 1 }, over={0, 0, 100} },
        strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
        strokeWidth = 4,
    }

        -- Center the button
    button1.x = display.contentCenterX
    button1.y = display.contentCenterY - 30

    local button2 = widget.newButton{
        label = "button",
        onEvent = handleButtonEvent,
        emboss = false,

        --propriedades do meu botÃ£o retangular
        shape = "roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={ 1, 0, 0, 1 }, over={0, 0, 100} },
        strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
        strokeWidth = 4
    }

        --local do botÃ£o
    button2.x = display.contentCenterX
    button2.y = display.contentCenterY + 20

    grupoLocal:insert(button1)
    grupoLocal:insert(button2)


    -- Change the button's label text
    button1:setLabel("°F para °C")
    button2:setLabel("K para °C")


	button1:addEventListener("touch", conversor1)

	button2:addEventListener("touch", conversor2)


	sceneGroup:insert(grupoLocal)

	end

	function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then



      elseif ( phase == "did" ) then

    end
	end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )
  local sceneGroup = self.view

	display.remove(grupoLocal)
	display.remove(sceneGroup)

	grupoLocal = nil
	sceneGroup = nil

end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene

