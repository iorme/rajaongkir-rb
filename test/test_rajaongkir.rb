require "minitest/autorun"
require "rajaongkir"

class RajaongkirTest < Minitest::Unit::TestCase
	$key = "API-KEY"
	def test_any_city
		rajaongkir = Rajaongkir.new $key

		params = {'province' => '6'}
		response = rajaongkir.city params
		assert_equal response.code,200
	end

	def test_any_province
		rajaongkir = Rajaongkir.new $key

		params = {'id' => '6'}
		response = rajaongkir.province params
		assert_equal response.code,200
	end

	def test_any_cost
		rajaongkir = Rajaongkir.new $key

		response = rajaongkir.cost(501, 114, 1000, "jne")
		assert_equal response.code,200
	end
end