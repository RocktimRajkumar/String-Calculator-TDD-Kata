class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..]
    else
      delimiter = /,|\n/
    end

    number_list = numbers.split(delimiter).map(&:to_i)
    negatives = number_list.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    number_list.sum
  end
end
