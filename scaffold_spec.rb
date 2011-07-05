Scaffoldhub::Specification.new do

  # Github URL where you will post your scaffold - the specified folder must contain this file
  base_url  'https://github.com/NiranjanSarade/cleditor_scaffold'

  # The name of your new scaffold: should be a single word
  name 'cleditor'

  # Metadata about this scaffold - these values are only used for display on scaffoldhub.org:
  metadata do

    # A short paragraph describing what this scaffold does
    description 'The cleditor scaffold is based on CLEditor jQuery plugin which provides a lightweight, full featured, cross browser, extensible, WYSIWYG HTML editor that can be easily added into any web site.'

    # 4x3 aspect ratio screen shot
    screenshot 'cleditor_screenshot.png'

    # Tag(s) to help scaffoldhub.org users find your scaffold
    tag 'jquery'
    tag 'cleditor'

    # Optionally specify an example of a scaffold parameter
    parameter_example 'FIELD_NAME'
    
  end

  # Define a model template - this ERB file will be used to generate a new
  # model class with this path & filename: app/models/NAME.rb
  model 'templates/model.rb'

  # Define an ActiveRecord migration template - this ERB file will be used to generate a new
  # migration class with this path & filename: db/migrate/TIMESTAMP_create_PLURAL_NAME.rb
  migration 'templates/migration.rb'

  # Define a controller template - this ERB file will be used to generate a new
  # controller class with this path & filename: app/controllers/PLURAL_NAME.rb
  controller 'templates/controller.rb'

  # You can use "with_options" to specify the same source folder for a series of templates:
  # You can also specify the same destination folder using the :dest option,
  # or just use the :src and :dest options on each keyword.
  with_options :src => 'templates' do
    view '_form.html.erb'
    view 'new.html.erb'
    view 'edit.html.erb'
    view 'index.html.erb'
    view 'show.html.erb'

    template 'layout.html.erb', :dest => 'app/views/layouts', :rename => 'PLURAL_NAME.html.erb'
  end
	
  with_options :src => 'templates/jquery', :dest => 'public/javascripts' do
    file 'jquery-1.6.1.min.js'
    file 'jquery.cleditor.min.js'
  end

  file 'templates/jquery/jquery.cleditor.css', :dest => 'public/stylesheets'

  with_options :src => 'templates/jquery', :dest => 'public/images' do
    file 'buttons.gif'
    file 'toolbar.gif'
  end

  post_install_message <<MESSAGE
Follow these steps to use the JQuery CLEditor plugin in your
new scaffold:
- Run "rake db:migrate" to create your new PLURAL_NAME database table
- Run your Rails server
- Open http://localhost:3000/PLURAL_NAME
... to see the index page. Now when you create a new record or update existing one with SCAFFOLD_PARAMETER, you will
notice that it adds the CLEditor functionality to textareas. CLEditor takes a standard html textarea element and turns it into a full featured rich text editor.
MESSAGE
  
end
