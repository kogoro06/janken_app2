# config/importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo-rails@7.0.0/dist/turbo.min.js" # 例として最新のURLを指定
pin "controllers", to: "controllers/application.js"
pin "@hotwired/stimulus", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus@3.2.2/dist/stimulus.umd.js"
# pin "@hotwired/turbo", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.6/dist/turbo.min.js" # 古い行がある場合は削除
pin "@rails/actioncable/src", to: "https://cdn.jsdelivr.net/npm/@rails/actioncable@7.2.1/dist/actioncable.min.js"
