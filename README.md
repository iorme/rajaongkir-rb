# Class untuk konsumsi API dari rajaongkir.com

## Requirement
unirest ([unirest ruby] (http://unirest.io/ruby.html))

# Instalasi
gem install rajaongkir

# Cara penggunaan
Request:
```ruby
require "rajaongkir"

rajaongkir = Rajaongkir.new "API-KEY"

params = {'province' => '6'}
response = rj.city params
puts response.raw_body

params = {'id' => '6'}
response = rj.province params
puts response.raw_body

puts rj.cost(501, 114, 1000, "jne").raw_body
```

Response:
```ruby
response.code
response.body
response.raw_body
```

Untuk keterangan lebih lanjut silahkan kunjungi [Dokumentasi RajaOngkir](http://rajaongkir.com/dokumentasi)