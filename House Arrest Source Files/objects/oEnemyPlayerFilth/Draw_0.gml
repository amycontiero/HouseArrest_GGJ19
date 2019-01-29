// Draw sprite depending on player state
if (!attacking) {
    switch (state) {
        case IDLE: 
            image_speed = 0.2;
            
            if (blocking)
                sprite_index = sPlayerIdleShield;
            else
                sprite_index = sFilthIdle;
        break;
        
        case RUN: 
            image_speed = 0.33; 
            
            if (blocking)
                sprite_index = sPlayerRunShield;
            else
                sprite_index = sFilthRun;
        break;
        
        case JUMP:
            // Mid jump   
            if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) {  
                if (blocking)
                    sprite_index = sPlayerJumpMShield;
                else
                    sprite_index = sFilthJumpM;  
           } else { 
                // Rise + fall
                if (vy <= 0) {
                    if (blocking)
                        sprite_index = sPlayerJumpUShield;
                    else  
                        sprite_index = sFilthJumpU;  
                } else {
                    if (blocking)
                        sprite_index = sPlayerJumpDShield;
                    else
                        sprite_index = sFilthJumpD;
                }
            }
             
            // When against a wall   
            if (cRight || cLeft)
                if (blocking)
                    sprite_index = sPlayerSlideShield;
                else
                    sprite_index = sFilthSlide;  
        break;
        
        case ROLL:
            // Don't do stuff here    
        break;
    }
}

// Draw player
if (onGround)
    draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, 0, c_white, image_alpha);    
else
    draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);
