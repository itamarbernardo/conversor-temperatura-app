local widget = require( "widget" )
--composer
local composer = require( "composer" )
local scene = composer.newScene()

local localGroup = display.newGroup( )

local irParaMenu = function( event )
    composer.gotoScene("farFORcel")
  end

local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end


function scene:create( event )

   local sceneGroup = self.view

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth*2, display.contentHeight*2)
	background:setFillColor(100, 0, 0)
   localGroup:insert(background)

	------Botão Home
   local rect = widget.newButton{
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
   rect.x = display.contentWidth - 100
   rect.y = 30
   localGroup:insert(rect)

   local d = display.newText("Digite a temperatura em  Kelvin: ", 150, 150)
   localGroup:insert(d)

	local tc

	local tk = native.newTextField( 130, 200, 220, 36 )
	localGroup:insert(tk)

	local texto = display.newText("Resultado: ", 50, 350)
	local resultado = native.newTextField( 176, 350, 170, 36 )
  localGroup:insert(texto)
  localGroup:insert(resultado)

	tk:addEventListener( "userInput", tk)


  rect:setLabel("Fahrenheit for Celsius")
  rect:addEventListener( "tap", irParaMenu )


function tk:userInput(event)
	if event.phase == "began" then
		event.target.text = ''

	elseif event.phase == "ended" then
		------

	elseif event.phase == "submitted" then

		print(tk.text)
    
		tc = tk.text - 273

		print("Valor em ºC: " .. tc)


		resultado.text = "" .. tc

	end

	end



   end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
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

   display.remove(localGroup)
   display.remove(sceneGroup)

   localGroup = nill
   sceneGroup = nill

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
