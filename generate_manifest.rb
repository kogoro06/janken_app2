# generate_manifest.rb
require 'erb'

# テンプレートファイルのパス
template_path = 'app/views/pwa/manifest.json.erb'
output_path = 'public/manifest.json'

# テンプレートの読み込み
template = File.read(template_path)
renderer = ERB.new(template)

# ERB テンプレートの処理
result = renderer.result

# 結果をファイルに書き込み
File.write(output_path, result)
