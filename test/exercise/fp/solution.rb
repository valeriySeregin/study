module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array
                         .filter { |film| !film['rating_kinopoisk'].nil? }
                         .filter { |film| !film['rating_kinopoisk'].to_f.zero? }
                         .filter { |film| !film['country'].nil? }
                         .filter { |film| film['country'].split(',').length >= 2 }
        rates_sum = filtered_films
                    .reduce(0) { |acc, film| acc + film['rating_kinopoisk'].to_f }
        rates_sum / filtered_films.length
      end

      def chars_count(films, threshold)
        films
          .filter { |film| !film['rating_kinopoisk'].nil? }
          .filter { |film| film['rating_kinopoisk'].to_f >= threshold }
          .map { |film| film['name'].split('').filter { |char| char.eql? 'и' } }
          .reduce(0) { |acc, film| acc + film.length }
      end
    end
  end
end
