package objects;

import flixel.FlxSprite;
import flixel.animation.FlxAnimationController;
import flixel.util.FlxColor;

class Ghost extends FlxSprite {
    public var player:Character = null;
    public var GhostTween:FlxTween = null;

    public function new(player:Character) {
        super();
        this.player = player;
        this.visible = false;
		this.antialiasing = true;
		this.updateHitbox();
		this.blend = HARDLIGHT;
		this.alpha = 0.8;
    }

    public function playAnim(animToPlay:String, force:Bool = false):Void {
        if(player == null)
        {
           return;
        }
        this.scale.copyFrom(player.scale);
        this.frames = player.frames;
	    this.animation.copyFrom(player.animation);
	    this.x = player.x;
		this.y = player.y;
		this.flipX = player.flipX;
		this.flipY = player.flipY;
        this.animation.play(animToPlay, true);
		this.offset.set(player.animOffsets.get(animToPlay)[0], player.animOffsets.get(animToPlay)[1]);
		this.visible = true;
		
		if (GhostTween != null)
		GhostTween.cancel();
		this.color = FlxColor.fromRGB(player.healthColorArray[0], player.healthColorArray[1], player.healthColorArray[2]);
		GhostTween = FlxTween.tween(this, {alpha: 0}, 0.75, {
			ease: FlxEase.linear,
			onComplete: function(twn:FlxTween)
		{
			GhostTween = null;
		}
			});
    }
}