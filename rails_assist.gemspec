# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_assist}
  s.version = "0.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Kristian Mandrup}]
  s.date = %q{2011-05-16}
  s.description = %q{Basic file operation helpers for working with Rails 3 artifacts}
  s.email = %q{kmandrup@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Changelog.md",
    "Gemfile",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/rails_assist.rb",
    "lib/rails_assist/app.rb",
    "lib/rails_assist/artifact.rb",
    "lib/rails_assist/artifact/directory.rb",
    "lib/rails_assist/artifact/files.rb",
    "lib/rails_assist/artifact/path.rb",
    "lib/rails_assist/directory.rb",
    "lib/rails_assist/directory/app.rb",
    "lib/rails_assist/directory/container.rb",
    "lib/rails_assist/directory/root.rb",
    "lib/rails_assist/file.rb",
    "lib/rails_assist/file/application.rb",
    "lib/rails_assist/file/environment.rb",
    "lib/rails_assist/file/gem_file.rb",
    "lib/rails_assist/file/routes_file.rb",
    "lib/rails_assist/file/special.rb",
    "lib/rails_assist/files.rb",
    "lib/rails_assist/macro.rb",
    "lib/rails_assist/namespaces.rb",
    "lib/rails_assist/rspec.rb",
    "lib/rails_assist/rspec/configure.rb",
    "rails_assist.gemspec",
    "sandbox/test.rb",
    "sandbox/test.txt",
    "spec/dir_spec_helper.rb",
    "spec/fixtures.rb",
    "spec/fixtures/.gitignore",
    "spec/fixtures/Gemfile",
    "spec/fixtures/README",
    "spec/fixtures/Rakefile",
    "spec/fixtures/app/controllers/application_controller.rb",
    "spec/fixtures/app/controllers/users_controller.rb",
    "spec/fixtures/app/helpers/application_helper.rb",
    "spec/fixtures/app/helpers/users_helper.rb",
    "spec/fixtures/app/licenses/blogging_license.rb",
    "spec/fixtures/app/mailers/user_mailer.rb",
    "spec/fixtures/app/models/user.rb",
    "spec/fixtures/app/models/user_observer.rb",
    "spec/fixtures/app/permits/user_permit.rb",
    "spec/fixtures/app/validators/email_validator.rb",
    "spec/fixtures/app/views/layouts/application.html.erb",
    "spec/fixtures/app/views/users/_form.html.erb",
    "spec/fixtures/app/views/users/edit.html.erb",
    "spec/fixtures/app/views/users/index.html.erb",
    "spec/fixtures/app/views/users/new.html.erb",
    "spec/fixtures/app/views/users/show.html.erb",
    "spec/fixtures/config.ru",
    "spec/fixtures/config/application.rb",
    "spec/fixtures/config/boot.rb",
    "spec/fixtures/config/database.yml",
    "spec/fixtures/config/environment.rb",
    "spec/fixtures/config/environments/development.rb",
    "spec/fixtures/config/environments/production.rb",
    "spec/fixtures/config/environments/test.rb",
    "spec/fixtures/config/initializers/backtrace_silencers.rb",
    "spec/fixtures/config/initializers/inflections.rb",
    "spec/fixtures/config/initializers/mime_types.rb",
    "spec/fixtures/config/initializers/my_init.rb",
    "spec/fixtures/config/initializers/secret_token.rb",
    "spec/fixtures/config/initializers/session_store.rb",
    "spec/fixtures/config/locales/en.yml",
    "spec/fixtures/config/routes.rb",
    "spec/fixtures/db/migrate/20100831135208_create_users.rb",
    "spec/fixtures/db/seeds.rb",
    "spec/fixtures/lib/tasks/.gitkeep",
    "spec/fixtures/public/404.html",
    "spec/fixtures/public/422.html",
    "spec/fixtures/public/500.html",
    "spec/fixtures/public/favicon.ico",
    "spec/fixtures/public/images/rails.png",
    "spec/fixtures/public/index.html",
    "spec/fixtures/public/javascripts/application.js",
    "spec/fixtures/public/javascripts/controls.js",
    "spec/fixtures/public/javascripts/dragdrop.js",
    "spec/fixtures/public/javascripts/effects.js",
    "spec/fixtures/public/javascripts/prototype.js",
    "spec/fixtures/public/javascripts/rails.js",
    "spec/fixtures/public/robots.txt",
    "spec/fixtures/public/stylesheets/.gitkeep",
    "spec/fixtures/public/stylesheets/scaffold.css",
    "spec/fixtures/script/rails",
    "spec/fixtures/test/fixtures/users.yml",
    "spec/fixtures/test/functional/users_controller_test.rb",
    "spec/fixtures/test/performance/browsing_test.rb",
    "spec/fixtures/test/test_helper.rb",
    "spec/fixtures/test/unit/helpers/users_helper_test.rb",
    "spec/fixtures/test/unit/user_test.rb",
    "spec/fixtures/vendor/plugins/.gitkeep",
    "spec/load_spec.rb",
    "spec/rails_assist/app_spec.rb",
    "spec/rails_assist/artifact/directory_spec.rb",
    "spec/rails_assist/artifact/files_spec.rb",
    "spec/rails_assist/artifact/path_spec.rb",
    "spec/rails_assist/artifact_spec.rb",
    "spec/rails_assist/directory/app_spec.rb",
    "spec/rails_assist/directory/container_spec.rb",
    "spec/rails_assist/directory/root_spec.rb",
    "spec/rails_assist/directory_spec.rb",
    "spec/rails_assist/file/application_spec.rb",
    "spec/rails_assist/file/environment_spec.rb",
    "spec/rails_assist/file/special_spec.rb",
    "spec/rails_assist/file_spec.rb",
    "spec/rails_assist/files_spec.rb",
    "spec/rails_assist/rspec/have_app_config_spec.rb",
    "spec/rails_assist_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/rails-assist}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.0}
  s.summary = %q{File operation helpers for Rails 3 artifacts}
  s.test_files = [
    "spec/dir_spec_helper.rb",
    "spec/fixtures.rb",
    "spec/fixtures/app/controllers/application_controller.rb",
    "spec/fixtures/app/controllers/users_controller.rb",
    "spec/fixtures/app/helpers/application_helper.rb",
    "spec/fixtures/app/helpers/users_helper.rb",
    "spec/fixtures/app/licenses/blogging_license.rb",
    "spec/fixtures/app/mailers/user_mailer.rb",
    "spec/fixtures/app/models/user.rb",
    "spec/fixtures/app/models/user_observer.rb",
    "spec/fixtures/app/permits/user_permit.rb",
    "spec/fixtures/app/validators/email_validator.rb",
    "spec/fixtures/config/application.rb",
    "spec/fixtures/config/boot.rb",
    "spec/fixtures/config/environment.rb",
    "spec/fixtures/config/environments/development.rb",
    "spec/fixtures/config/environments/production.rb",
    "spec/fixtures/config/environments/test.rb",
    "spec/fixtures/config/initializers/backtrace_silencers.rb",
    "spec/fixtures/config/initializers/inflections.rb",
    "spec/fixtures/config/initializers/mime_types.rb",
    "spec/fixtures/config/initializers/my_init.rb",
    "spec/fixtures/config/initializers/secret_token.rb",
    "spec/fixtures/config/initializers/session_store.rb",
    "spec/fixtures/config/routes.rb",
    "spec/fixtures/db/migrate/20100831135208_create_users.rb",
    "spec/fixtures/db/seeds.rb",
    "spec/fixtures/test/functional/users_controller_test.rb",
    "spec/fixtures/test/performance/browsing_test.rb",
    "spec/fixtures/test/test_helper.rb",
    "spec/fixtures/test/unit/helpers/users_helper_test.rb",
    "spec/fixtures/test/unit/user_test.rb",
    "spec/load_spec.rb",
    "spec/rails_assist/app_spec.rb",
    "spec/rails_assist/artifact/directory_spec.rb",
    "spec/rails_assist/artifact/files_spec.rb",
    "spec/rails_assist/artifact/path_spec.rb",
    "spec/rails_assist/artifact_spec.rb",
    "spec/rails_assist/directory/app_spec.rb",
    "spec/rails_assist/directory/container_spec.rb",
    "spec/rails_assist/directory/root_spec.rb",
    "spec/rails_assist/directory_spec.rb",
    "spec/rails_assist/file/application_spec.rb",
    "spec/rails_assist/file/environment_spec.rb",
    "spec/rails_assist/file/special_spec.rb",
    "spec/rails_assist/file_spec.rb",
    "spec/rails_assist/files_spec.rb",
    "spec/rails_assist/rspec/have_app_config_spec.rb",
    "spec/rails_assist_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<sugar-high>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.7"])
      s.add_development_dependency(%q<rspec>, [">= 2.4.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<sugar-high>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.7"])
    else
      s.add_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_dependency(%q<sugar-high>, ["~> 0.4.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.7"])
      s.add_dependency(%q<rspec>, [">= 2.4.1"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_dependency(%q<sugar-high>, ["~> 0.4.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.7"])
    end
  else
    s.add_dependency(%q<require_all>, ["~> 1.2.0"])
    s.add_dependency(%q<sugar-high>, ["~> 0.4.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.7"])
    s.add_dependency(%q<rspec>, [">= 2.4.1"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<require_all>, ["~> 1.2.0"])
    s.add_dependency(%q<sugar-high>, ["~> 0.4.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.7"])
  end
end

