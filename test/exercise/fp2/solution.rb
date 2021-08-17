module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&proc)
        my_reduce([]) { |acc, item| acc << proc.call(item) }
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, item| acc << yield(item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, item| item.nil? ? acc : acc << item }
      end

      def iter_arr_for_my_reduce(arr, old_acc, &proc)
        return old_acc if arr.empty?

        head, *tail = arr
        new_acc = proc.call(old_acc, head)
        iter_arr_for_my_reduce(tail, new_acc, &proc)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &proc)
        head, *tail = self
        start_acc = acc.nil? ? head : acc
        start_arr = acc.nil? ? tail : self
        iter_arr_for_my_reduce(start_arr, start_acc, &proc)
      end
    end
  end
end
