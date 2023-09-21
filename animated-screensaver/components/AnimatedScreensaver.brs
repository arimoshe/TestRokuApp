    Function OnAnimChanged() as Void 'Function to start all the animations inside screensaver
        m.Poster1UpDownAnimation = m.top.FindNode("Poster1UpDownAnimation")
        m.Poster1LeftRightAnimation = m.top.FindNode("Poster1LeftRightAnimation")
        m.Poster2UpDownAnimation = m.top.FindNode("Poster2UpDownAnimation")
        m.Poster2LeftRightAnimation = m.top.FindNode("Poster2LeftRightAnimation")
        m.Poster2UpDownAnimation.control = "start"
        m.Poster2LeftRightAnimation.control = "start"

    end Function    

    function changeBackground() as void 'Function that changes the background image to the next image in the m.pictures array
        if (m.count >= 4 )
            m.count = -1
        end if
        if (m.count2 >= 4)
            m.count2 = 0
        end if
        m.count += 2
        m.count2 += 2
        m.Poster2.uri = m.pictures[m.count]
        m.Poster1.uri = m.pictures[m.count2]
    end function

    Function init() 'Function is run when XML is parsed
        m.top.backgroundColor = "0x000000FF" 'Set background color to black
        m.top.backgroundURI = "" 'Set background URI (image) to empty so background color displays
        
              
        
        m.Poster1UpDownAnimation = m.top.findNode("Poster1UpDownAnimation") 'Sets pointers to Animation nodes. This is so we can access their animation controls
        m.Poster1LeftRightAnimation = m.top.findNode("Poster1LeftRightAnimation")
        
        m.pictures = [] ' For loop to load images into m.pictures array
        for i = 1 to 5
            m.pictures.push("pkg:/images/" + i.toStr() + ".jpg") 'Loads images 1-5 in image folder into m.pictures array
        end for
        m.count = 0

        m.Poster1 = m.top.findNode("Poster1") 'Sets pointer to FadeAnimation node
        m.Poster1.uri = m.pictures[0] 'Sets Background art to first picture

        m.global.observeField("PicSwap", "changeBackground")
        
        
        OnAnimChanged() 'Calls function (located at the top) to start all animations inside the screensaver
    end Function