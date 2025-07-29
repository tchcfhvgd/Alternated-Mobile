package objects;

class Ghost extends PlayState
{
	public var ghostDadTween:FlxTween = null;
	public var ghostGfTween:FlxTween = null;
	public var ghostBfTween:FlxTween = null;
	public var qqqeb:String;
	
	public function new(char:String)
	{
		super();
		qqqeb = char;
	}
	
	public function playAnim(animToPlay:String, force:Bool = false)
		{
			var player:Character = dad;
			var ghost:FlxSprite = ghostDad;
		switch(qqqeb.toLowerCase().trim()){
				case 'bf' | 'boyfriend' | '0' | 'ghostBf':
					ghost = ghostBf;
					player = boyfriend;
				case 'dad' | 'opponent' | '1' | 'ghostDad':
					ghost = ghostDad;
					player = dad;
				case 'gf' | 'opponent2' | '2' | 'ghostGf':
					ghost = ghostGf;
					player = gf;
		}
		   if(ghost == null)
		   return;
		    
		    ghost.frames = player.frames;
			ghost.animation.copyFrom(player.animation);
			ghost.x = player.x;
			ghost.y = player.y;
			ghost.animation.play(animToPlay, force);
			ghost.offset.set(player.animOffsets.get(animToPlay)[0], player.animOffsets.get(animToPlay)[1]);
			ghost.flipX = player.flipX;
			ghost.flipY = player.flipY;
			ghost.blend = HARDLIGHT;
			ghost.alpha = 0.6;
			ghost.visible = true;
			
			
			switch(qqqeb.toLowerCase().trim()){
				case 'bf' | 'boyfriend' | '0' | 'ghostBf':
				
			if (ghostBfTween != null)
						ghostBfTween.cancel();
					ghost.color = FlxColor.fromRGB(boyfriend.healthColorArray[0], boyfriend.healthColorArray[1], boyfriend.healthColorArray[2]);
					ghostBfTween = FlxTween.tween(ghostBf, {alpha: 0}, 0.75, {
						ease: FlxEase.linear,
						onComplete: function(twn:FlxTween)
						{
							ghostBfTween = null;
						}
					});
			case 'dad' | 'opponent' | '1' | 'ghostDad':
		    if (ghostDadTween != null)
						ghostDadTween.cancel();
					ghost.color = FlxColor.fromRGB(dad.healthColorArray[0], dad.healthColorArray[1], dad.healthColorArray[2]);
					ghostDadTween = FlxTween.tween(ghostDad, {alpha: 0}, 0.75, {
						ease: FlxEase.linear,
						onComplete: function(twn:FlxTween)
						{
							ghostDadTween = null;
						}
					});
				case 'gf' | 'opponent2' | '2' | 'ghostGf':
					if (ghostGfTween != null)
						ghostGfTween.cancel();
					ghost.color = FlxColor.fromRGB(gf.healthColorArray[0], gf.healthColorArray[1], gf.healthColorArray[2]);
					ghostGfTween = FlxTween.tween(ghostGf, {alpha: 0}, 0.75, {
						ease: FlxEase.linear,
						onComplete: function(twn:FlxTween)
						{
							ghostGfTween = null;
						}
					});
		}
	}
}
