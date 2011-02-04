describe("RomanNumber", function() {
	describe("can convert from arabic to roman", function() {
		it("1 is converted to I", function() {
			expect(new RomanNumber(1).toString()).toEqual("I");
		});
		
		it("5 is converted to V", function() {
			expect(new RomanNumber(5).toString()).toEqual("V");
		});
		
		it("10 is converted to X", function() {
			expect(new RomanNumber(10).toString()).toEqual("X");
		});
	});
});
