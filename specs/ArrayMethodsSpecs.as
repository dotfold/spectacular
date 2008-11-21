describe('ArrayMethods', function():void {
  describe('pluck', function():void {
    it('should return an array of the value of the given field for each item', function():void {
      
      assertThat(ArrayMethods.pluck('a bee seady ee effigy'.split(' '), 'length'), equalTo([1, 3, 5, 2, 6]));
    });
  });

  describe('inject', function():void {
    it('should pass the memo and each item individually to the iterator function and return the memo', function():void {
      
      var memo:Number = 0;
      var values:Array = [1, 2, 3, 4];
      var sum:Function = function(acc:Number, value:Number):Number {
        return acc + value;
      };
      
      assertThat(ArrayMethods.inject(memo, values, sum), equalTo(10));
    });
  });
  
  describe('unfold', function():void {
    it('should work for simple values', function():void {

      var p:Function = function(n:Number):Boolean { return n > 0; };
      var t:Function = function(n:Number):Number { return n - 2; };
      var i:Function = t;

      assertThat(ArrayMethods.unfold(10, p, t, i), equalTo([8, 6, 4, 2, 0]));
    });
    
    it('should work for complex values', function():void {
      var parent:Object = { values: [1, 2, 3] };
      var child1:Object = { parent: parent, values: [4, 5, 6] };
      var child2:Object = { parent: child1, values: [7, 8, 9] };

      var predicate  :Function = function(o:Object):Boolean { return o && o.values != null };
      var transformer:Function = function(o:Object):Object { return o.values; };
      var incrementor:Function = function(o:Object):Object { return o.parent; }

      assertThat(ArrayMethods.unfold(child2, predicate, transformer, incrementor), equalTo([[7, 8, 9], [4, 5, 6], [1, 2, 3]]));
    });
  });

  describe('flatten', function():void {
    it('should take a nested array and return a one dimensional array', function():void {
      
      assertThat(ArrayMethods.flatten([1, 2, [3, 4, 5, [6], [7, 8]], 9]), equalTo([1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });
  })

  describe('zip', function():void {
    it('should take arrays arguments and return an array where each entry is an array of the values at that index in the argument arrays', function():void {

      assertThat(ArrayMethods.zip([1, 2, 3], ['a', 'b', 'c']), 
                 equalTo([[1, 'a'], [2, 'b'], [3, 'c']]));
                 
      assertThat(ArrayMethods.zip([1, 2, 3], ['a', 'b', 'c'], [true, true, false, true]), 
                 equalTo([[1, 'a', true], [2, 'b', true], [3, 'c', false], [null, null, true]]));
    });
  });

  describe('compact', function():void {
    it('should return an array without null values', function():void {
      
      assertThat(ArrayMethods.compact([null]), equalTo([]));
      assertThat(ArrayMethods.compact([null, null, 3, null]), equalTo([3]));
      assertThat(ArrayMethods.compact(['toast', 'waffles', null, 'crumpets']), equalTo(['toast', 'waffles', 'crumpets']));
    });
  });

  describe('unique', function():void {
    it('should return an array without duplicate values', function():void {
      
      assertThat(ArrayMethods.unique([1, 1, 2, 3, 5]), equalTo([1, 2, 3, 5]));
      assertThat(ArrayMethods.unique(['one', 'two', 'two', 'two']), equalTo(['one', 'two']));
    });
  });

  describe('partition', function():void {
    it('should separate values on the boolean return value of the iterator function', function():void {
      
      var greaterThan3:Function = function(value:Number):Boolean { return value >3 };
      
      assertThat(ArrayMethods.partition([1, 2, 3, 4, 5], greaterThan3), 
                 equalTo([[4, 5], [1, 2, 3]]));
    });
  });

  // bucket / distribute / ?
  describe('buckets', function():void {
    it('should separate values on the return value of the iterator function', function():void {
      
      var mod3:Function = function(value:Number):int { return value % 3; };
      
      assertThat(ArrayMethods.buckets([1, 2, 3, 4, 5, 6, 7, 8, 9], mod3),
                 equalTo([[3, 6, 9], [1, 4, 7], [2, 5, 8]]));
    });    
  });

  describe('contains', function():void {
    it('should be true if the array contains the value', function():void {
      
      assertThat(ArrayMethods.contains([], 0), equalTo(false));
      assertThat(ArrayMethods.contains([1, 2, 3], 0), equalTo(false));
      assertThat(ArrayMethods.contains([1, 2, 3], 3), equalTo(true));
    });
  });

  // find
  describe('find', function():void {
    it('should return the first matching item', function():void {
      
      var values:Array = [1, 1, 2, 3, 5, 8];
      var finder:Function = function(n:Number, i:int, a:Array):Boolean {
        return n > 4;
      };
      
      assertThat(ArrayMethods.find(values, finder), equalTo(5));
    });
  });
});
