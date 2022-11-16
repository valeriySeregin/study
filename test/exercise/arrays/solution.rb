module Exercise
  module Arrays
    class << self
      def get_max(array)
        max = array.first
        array.each { |item| max = item if item > max }
        max
      end

      def replace(array)
        max = get_max array
        result = []
        array.length.times do |i|
          result[i] = array[i] >= 0 ? max : array[i]
        end
        result
      end

      def get_binary_search_result(arr, query, low, high)
        return -1 if arr.empty? || low > high

        mid = (low + high) / 2

        case arr[mid] <=> query
        when -1
          current_low = mid + 1
          get_binary_search_result arr, query, current_low, high
        when 1
          current_high = mid - 1
          get_binary_search_result arr, query, low, current_high
        else
          mid
        end
      end

      def search(array, query)
        get_binary_search_result array, query, 0, array.length - 1
      end
    end
  end
end
