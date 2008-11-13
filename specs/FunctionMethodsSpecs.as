describe('FunctionMethods', function():void {
  describe('iterator', function():void {
    it('should create a function that can be used with the Array methods', function():void {
      
      // TODO we cannot check the arity of the returned function so there is not much point doing this
      /*expect(FunctionMethods.toIterator, function():void {}).should(eq, null);
      expect(FunctionMethods.toIterator, function(value:Object):void {}).should(eq, null);
      expect(FunctionMethods.toIterator, function(value:Object, i:int):void {}).should(eq, null);
      expect(FunctionMethods.toIterator, function(value:Object, i:int, a:Array):void {}).should(eq, null);
      expect(FunctionMethods.toIterator, function(value:Object, ...rest):void {}).should(eq, null);*/
      
      // the typing saving is negligible, *sigh* -- unless we include aliases like $i
      expect([0, 10, 20, 30].filter, FunctionMethods.toIterator(function(value:Number):Boolean { 
        return value > 10;
      })).should(eq, [20, 30]);
      
    });
  });
});
