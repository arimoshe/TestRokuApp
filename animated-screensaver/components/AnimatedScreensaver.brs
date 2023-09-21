    Function OnAnimChanged() as Void 'Function to start all the animations inside screensaver
        
        m.Poster2UpDownAnimation.control = "start"

        if (Rnd(0) > 0.5)
            offsetX = 1
        else
            offsetX = -1
        end if
        if (Rnd(0) > 0.5)
            offsetY = 1
        else
            offsetY = -1
        end if

        offsetX = (-960 + (offsetX * Rnd(960)))
        offsetY = (-540 + (offsetY * Rnd(540)))
        print offsetX
        print offsetY
        m.myInterp4 = m.top.findNode("myInterp4")
        m.myInterp4.keyValue = [[0,0],[offsetX, offsetY]]
        print m.myInterp4.keyValue[1]
    
        m.Poster2LeftRightAnimation.control = "start"

        
        m.Poster2OpacAnimation.control = "start"

    end Function    

    function changeBackground() as void 'Function that changes the background image to the next image in the m.pictures array
        
        if (Rnd(0) > 0.5) 
            offsetX = 1
        else
            offsetX = -1 
        end if
        if (Rnd(0) > 0.5)
            offsetY = 1
        else
            offsetY = -1
        end if
        
        offsetX = (-960 + (offsetX * Rnd(960)))
        offsetY = (-540 + (offsetY * Rnd(540)))
        print offsetX
        print offsetY
        m.myInterp4 = m.top.findNode("myInterp4")
        m.myInterp4.keyValue = [[0, 0], [offsetX, offsetY]]
        print m.myInterp4.keyValue[1]

        m.Poster2.uri = m.Poster1.uri
        m.Poster2OpacAnimation.control = "start"
        if (m.count >= 9)
            print "resetting count"
            m.count = 0
        else 
            m.count += 1
        end if
        m.Poster1.uri = m.pictures[m.count]

    
        
        
    end function
    
   
    

    Function init() 'Function is run when XML is parsed
        m.top.backgroundColor = "0x000000FF" 'Set background color to black
        m.top.backgroundURI = "" 'Set background URI (image) to empty so background color displays
        
              
        
        m.Poster1UpDownAnimation = m.top.findNode("Poster1UpDownAnimation") 'Sets pointers to Animation nodes. This is so we can access their animation controls
        m.Poster1LeftRightAnimation = m.top.findNode("Poster1LeftRightAnimation")
        m.Poster2UpDownAnimation = m.top.findNode("Poster2UpDownAnimation") 'Sets pointers to Animation nodes. This is so we can access their animation controls
        m.Poster2LeftRightAnimation = m.top.findNode("Poster2LeftRightAnimation")
        m.Poster1OpacAnimation = m.top.findNode("Poster1OpacAnimation")
        m.Poster2OpacAnimation = m.top.findNode("Poster2OpacAnimation")

        m.pictures = [] ' For loop to load images into m.pictures array
        for i = 1 to 10
            m.pictures.push("pkg:/images/" + i.toStr() + ".jpg") 'Loads images 1-5 in image folder into m.pictures array
        end for
        m.count = 1

        print "Starting"

        m.Poster1 = m.top.findNode("Poster1")
        m.Poster2 = m.top.findNode("Poster2")
        m.Poster1.uri = m.pictures[1]
        m.Poster2.uri = m.pictures[0] 

        m.global.observeField("MyField", "changeBackground")
        
        
        
        OnAnimChanged() 'Calls function (located at the top) to start all animations inside the screensaver
    end Function