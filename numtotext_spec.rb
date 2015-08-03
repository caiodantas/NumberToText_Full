require "./numtotext.rb"

describe NumberToText do
 # 	describe "#threeDigits" do
	# 	it "test 3 digit number" do
	# 		prog = NumberToText.new
	# 		prog.setNumber(765)
	# 		expect(prog.convertAndPrint).to eq "seven hundred sixty five"
	# 	end
	# end

	describe "#units" do
		it "test if units are correct to the number of digits (thousands, millions, etc)" do
			prog = NumberToText.new
			prog.setNumber(12300765)
			expect(prog.convertAndPrint).to eq "twelve million three hundred thousand seven hundred sixty five"
		end
	end
end