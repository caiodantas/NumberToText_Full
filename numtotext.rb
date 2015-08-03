numerals = Array["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens = Array["ten", "eleven", "twelve", "thirteen", "fourteen", "fiveteen", "sixteen", "seventeen", "eighteen", "nineteen"]
decimals = Array["", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"]
units = Array["", "thousand", "million", "billion", "trillion"]

inputNumber = 2123012
numbers = inputNumber.to_s

digit = 0
$numeralText = ""
fullText = ""
unitIndex = 0

def addNumeralText(text)
	if text.length === 0
		return
	end

	$numeralText = text.to_s + " " + $numeralText.to_s
end

if numbers === "0"
	fullText = "zero"
else
	i = numbers.length - 1
	until i < 0 do
		value = numbers[i].to_i
		digit += 1

		if digit === 1
			if i - 1 >= 0 and numbers[i-1] === "1"
				addNumeralText(teens[value])
				digit += 1
				i -= 1
			elsif value > 0
				addNumeralText(numerals[value])
			end
		elsif digit === 2 && value >= 2
			addNumeralText(decimals[value])
		elsif digit === 3 && value > 0
			addNumeralText('hundred')
			addNumeralText(numerals[value])
		end
		

		if digit === 3 || i === 0
			if $numeralText.length > 0
				addedText = $numeralText
				if unitIndex > 0
					addedText += units[unitIndex] + ' '
				end
				fullText = addedText + fullText
				$numeralText = ''
			end
			
			digit = 0
			unitIndex += 1
		end

		i -= 1
	end
end

print fullText