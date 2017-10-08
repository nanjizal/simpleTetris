package tetrisTriangles.game;
import tetrisTriangles.game.Controller;
import tetrisTriangles.game.ShapeGenerator;
// Setup position of Controller visual elements
class Layout{
	var controller: Controller;
	var above       = 7;
	var noBlocks    = 1;
	var originP:    { x: Float, y: Float };
	var wide: 		Int;
	var hi: 		Int;
	var dia: 		Float;
	var shapeid 	= 1;
	public function new( 	controller_: 	Controller,  originP_: 	{ x: Float, y: Float }
						, 	wide_: 			Int, 		 hi_: 		Int
						, 	dia_: 			Float ){
		controller = controller_;
		wide = wide_;
		hi = hi_;
		dia = dia_;
		originP = originP_;
        var bottomP = { x: originP.x, y: originP.y + dia * hi };
        background();
        fallingBlocks( noBlocks, above * dia );
        bottom( bottomP );
	}
	function background(){
        controller.createBg( originP, wide, hi, 10, 0, 9, 0 );
    }
    function fallingBlocks( noBlocks: Int, aboveY: Float ){
        var randX   = 0.;
		var x = originP.x;
		var y = originP.y;// + 5*dia;
        for( i in 0...noBlocks ){
            var m = i % 6 + 1; // restart colors
            randX = dia + dia * Math.round( Math.random() * ( wide - 0.5 ));
            var shape = controller.createShape( { x: x + randX, y: y - i * aboveY }, m , m + 1 );//, TetrisShape.tetris_l );//  <- can choose on shape.
		}
    }
	public function createTile(){
		var x = originP.x;
		var y = originP.y;// + 5*dia;
		var m = shapeid % 6 + 1; // restart colors
        var randX = dia + dia * Math.round( Math.random() * ( wide - 1.5 ));
    	var shape = controller.createShape( { x: x + randX, y: y }, m , m + 1 );// , TetrisShape.tetris_l );//  <- can choose on shape.
	    shapeid++;
	}
    function bottom( p: { x: Float, y: Float } ){
        controller.createBottom( p, wide, 8, 9 );
    }
}