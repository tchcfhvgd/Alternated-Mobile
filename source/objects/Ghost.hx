package objects;

import flixel.FlxSprite;
import flixel.animation.FlxAnimationController;
import flixel.util.FlxColor;

class Ghost extends FlxSprite {
    public var player:Character;
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
        this.visible = true;
        this.scale.copyFrom(player.scale);
        this.frames = player.frames;
	    this.animation.copyFrom(player.animation);
	    this.x = player.x;
		this.y = player.y;
		this.flipX = player.flipX;
		this.flipY = player.flipY;
        this.animation.play(animToPlay, force);
		this.offset.set(player.animOffsets.get(animToPlay)[0], player.animOffsets.get(animToPlay)[1]);
		this.color = FlxColor.fromRGB(player.healthColorArray[0], player.healthColorArray[1], player.healthColorArray[2]);
		this.alpha = 0.8;
		
		if (GhostTween != null)
		GhostTween.cancel();
		GhostTween = FlxTween.tween(this, {alpha: 0}, 0.75, {
			ease: FlxEase.linear,
			onComplete: function(twn:FlxTween)
		{
			GhostTween = null;
		}
			});
    }
}