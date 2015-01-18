Gem::Specification.new do |s|
  s.name        = 'rajaongkir'
  s.version     = '0.1.3.1'
  s.summary     = "Simple class untuk API rajaongkir.com"
  s.description = "Simple class ruby untuk API rajaongkir.com"
  s.authors     = ["Harry Yunanto"]
  s.email       = 'yunanto2209@gmail.com'
  s.homepage    = 'https://github.com/iorme/rajaongkir-rb'
  s.license     = 'MIT'
  s.add_development_dependency "unirest", '~> 0'
  s.required_ruby_version = '~> 2.0'

  s.files       = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
