server 'www.dev.kg', user: 'root', roles: %w{app db web}
set :linked_files, fetch(:linked_files, []).push('.env.production')