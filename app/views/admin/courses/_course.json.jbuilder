json.extract! course, :id, :name, :name_sym, :introduction, :price, :position, :state, :created_at, :updated_at
json.url course_url(course, format: :json)
