# -*- coding: utf-8 -*-
require 'unirest'

# simple class ruby untuk API Rajaongkir
# http://rajaongkir.com/dokumentasi

class Rajaongkir

	# key = API KEY dari rajaongkir
	def initialize(key = nil)
		@@key = key
		@@base_url = "http://rajaongkir.com/api/"
	end

	# fungsi untuk mendapatkan data kota
	#
	# params = {'province' => '6', 'id' => '161'}
	def city(params = nil)
		request "city",params
	end

	# fungsi untuk mendapatkan data provinsi
	#
	# params = {'id' => '6'}
	def province(params = nil)
		request "province", params
	end

	# fungsi untuk mendapatkan data ongkos kirim
	#
	# origin ID kota asal
    # destination ID kota tujuan
    # weight Berat kiriman dalam gram
    # courier Kode kurir (jne, pos, tiki)
	def cost(origin, destination, weight, courier = 'pos')
		params = {:origin => origin, :destination => destination, :weight => weight, :courier => courier}

		request "cost", params, 'post'
	end

	# fungsi untuk mengirimkan request ke rajaongkir
	private
	def request(function, params = nil, http_method = 'get')
		if @@key.nil? || @@key == ''
			return "API-KEY tidak boleh kosong"
		else
			return Unirest.send(
					http_method.to_sym, 
					@@base_url + function, 
					headers:{"key" => @@key},	
					parameters: params
				)
		end
	end
end
