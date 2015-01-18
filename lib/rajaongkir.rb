# -*- coding: utf-8 -*-
require 'unirest'
require File.join(File.dirname(__FILE__), "response.rb")

# simple class ruby untuk API Rajaongkir
# http://rajaongkir.com/dokumentasi

class Rajaongkir
	attr_accessor :key, :base_url

	# key = API KEY dari rajaongkir
	def initialize(key = nil)
		@key = key
		@base_url = "http://rajaongkir.com/api/"
	end

	# fungsi untuk mendapatkan API-KEY
	def get_key
		@key
	end

	# fungsi untuk mendapatkan base_url
	def get_base_url
		$base_url
	end

	# fungsi untuk mendapatkan data kota
	#
	# params = {'province' => '6', 'id' => '161'}
	def city(params = {})
		request "city",params
	end

	# fungsi untuk mendapatkan data provinsi
	#
	# params = {'id' => '6'}
	def province(params = {})
		request "province", params
	end

	# fungsi untuk mendapatkan data ongkos kirim
	#
	# origin ID kota asal
    # destination ID kota tujuan
    # weight Berat kiriman dalam gram
    # courier Kode kurir (jne, pos, tiki)
	def cost(origin = '', destination = '', weight = 0, courier = 'pos')
		error_message = Hash.new

		if origin == ''
			error = 1
			error_message['origin'] = 'origin tidak boleh kosong'
		end
		if destination == ''
			error = 1
			error_message['destination'] = 'destination tidak boleh kosong'
		end
		if weight == 0
			error = 1
			error_message['weight'] = 'weight harus lebih besar dari 0'
		end
		
		if error == 1
			params = set_params 500, error_message
			data_return = Response.new params

			return data_return
		else		
			params = {:origin => origin, :destination => destination, :weight => weight, :courier => courier}

			request "cost", params, 'post'
		end
	end

	# fungsi untuk set params yang digunakan pada response
	def set_params code, message
		params = Hash.new
		params['code'] = code
		params['body'] = message
		params['headers'] = nil

		return params
	end

	# fungsi untuk mengirimkan request ke rajaongkir
	private
	def request(function, params = {}, http_method = 'get')
		if @key.nil? || @key == ''
			body = {"error" => "API-KEY tidak boleh kosong"}
			params = set_params 500, body 
		else
			data = Unirest.send(
					http_method.to_sym, 
					@base_url + function, 
					headers:{"key" => @key},	
					parameters: params
				)

			params['code'] = data.code
			params['body'] = data.body
			params['headers'] = data.headers
		end

		Response.new params
	end
end
