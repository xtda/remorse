require "administrate/base_dashboard"

class RosterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    player_name: Field::String,
    player_class: PlayerclassField,
    player_spec: Field::String,
    thumbnail_link: Field::String,
    role: Field::EnumField,
    hidden: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :player_name,
    :player_class,
    :player_spec,
    :role,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :player_name,
    :player_class,
    :player_spec,
    :role,
    :hidden,
    :thumbnail_link,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :player_name,
    :player_class,
    :player_spec,
    :thumbnail_link,
    :role,
    :hidden,
  ].freeze

  # Overwrite this method to customize how rosters are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(roster)
  #   "Roster ##{roster.id}"
  # end
end
